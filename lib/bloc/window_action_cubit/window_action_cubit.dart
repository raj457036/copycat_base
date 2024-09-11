import 'package:bloc/bloc.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

part 'window_action_cubit.freezed.dart';
part 'window_action_state.dart';

const compactViewWidth = 368.0;
const compactViewMinHeight = 600.0;

enum ViewMode {
  docked,
  floating,
}

enum DockedPosition {
  none,
  top,
  bottom,
}

@injectable
class WindowActionCubit extends Cubit<WindowActionState> {
  Display? primaryDisplay;
  ViewMode viewMode = ViewMode.floating;
  bool isCompactMode = false;
  bool isFocused = false;
  DockedPosition dockedPosition = DockedPosition.none;

  WindowActionCubit() : super(const WindowActionState.loaded()) {
    setupScreenInfo();
  }

  Size get compactWindowSize {
    return Size(
      compactViewWidth,
      primaryDisplay?.size.height ?? compactViewMinHeight,
    );
  }

  Future<void> setupScreenInfo() async {
    primaryDisplay = await screenRetriever.getPrimaryDisplay();
    isFocused = await windowManager.isFocused();
  }

  Future<void> fetch() async {
    final isPinned = await windowManager.isAlwaysOnTop();
    emit(
      WindowActionState.loaded(
        pinned: isPinned,
        compact: isCompactMode,
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

  Future<void> compactView() async {
    if (viewMode != ViewMode.floating) return;
    await windowManager.setSize(compactWindowSize);
    final position = await calcWindowPosition(
      compactWindowSize,
      Alignment.centerRight,
    );
    await windowManager.setPosition(position, animate: true);
    isCompactMode = true;
    emit(state.copyWith(compact: isCompactMode));
  }

  Future<void> windowedView() async {
    if (viewMode != ViewMode.floating) return;
    await windowManager.setSize(initialWindowSize);
    await windowManager.center(animate: true);
    isCompactMode = false;
    emit(state.copyWith(compact: isCompactMode));
  }

  Future<void> toggleCompact({bool reset = false}) async {
    if (isCompactMode || reset) {
      await windowedView();
    } else {
      await compactView();
    }
  }

  Future<void> hide({bool animated = true}) async {
    if (viewMode == ViewMode.floating) {
      if (animated && primaryDisplay != null) {
        final currentPosition = await windowManager.getPosition();
        windowManager.setPosition(
          Offset(
            currentPosition.dx,
            primaryDisplay?.size.height ?? 600,
          ),
          animate: true,
        );

        await Future.delayed(const Duration(milliseconds: 200));
      }

      await windowManager.hide();
      isFocused = false;
    }
  }

  Future<void> show({bool animated = true}) async {
    if (viewMode == ViewMode.floating) {
      windowManager.show();
      windowManager.center(animate: animated);
      isFocused = true;
    }
  }
}
