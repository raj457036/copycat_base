import 'package:bloc/bloc.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';
import 'package:window_manager/window_manager.dart';

part 'window_action_cubit.freezed.dart';
part 'window_action_state.dart';

const compactWindowPosition = Offset(1, 0);

enum ViewMode {
  docked,
  floating,
}

@injectable
class WindowActionCubit extends Cubit<WindowActionState> {
  late final Size screenSize;
  late final Size compactWindowSize;

  ViewMode viewMode = ViewMode.floating;

  WindowActionCubit() : super(const WindowActionState.loaded()) {
    final view = PlatformDispatcher.instance.views.first;
    var size = view.display.size;
    if (size.isEmpty) {
      size = view.physicalSize;
    }

    screenSize = size / view.devicePixelRatio;
    final int platformDiff;
    if (Platform.isMacOS) {
      platformDiff = 25;
    } else {
      platformDiff = 0;
    }
    final height = screenSize.height - platformDiff;
    compactWindowSize = Size(368.0, height > 0 ? height : 600.0);
  }

  Future<bool> isCompactMode() async {
    final size = await windowManager.getSize();
    return size == compactWindowSize;
  }

  Future<void> fetch() async {
    final isPinned = await windowManager.isAlwaysOnTop();
    final isCompactMode_ = await isCompactMode();
    emit(
      WindowActionState.loaded(
        pinned: isPinned,
        compact: isCompactMode_,
        loading: false,
      ),
    );
  }

  Future<void> reset() async {
    toggleCompact(reset: true);
    togglePinned(reset: true);
  }

  Future<void> togglePinned({bool reset = false}) async {
    final isPinned = reset ? true : await windowManager.isAlwaysOnTop();
    await windowManager.setAlwaysOnTop(!isPinned);
    emit(state.copyWith(pinned: !isPinned));
  }

  Future<void> toggleCompact({bool reset = false}) async {
    final compactMode = reset ? true : await isCompactMode();

    await windowManager.setSize(
      compactMode ? initialWindowSize : compactWindowSize,
      // animate: true,
    );
    if (!compactMode) {
      final position = await calcWindowPosition(
        compactWindowSize,
        Alignment.centerRight,
      );
      await windowManager.setPosition(position, animate: true);
    } else {
      await windowManager.center(animate: true);
    }
    emit(state.copyWith(compact: !compactMode));
  }

  Future<void> hide() async {
    if (viewMode == ViewMode.floating) {
      windowManager.hide();
    }
  }

  Future<void> show() async {
    if (viewMode == ViewMode.docked) {
      windowManager.show();
    }
  }
}
