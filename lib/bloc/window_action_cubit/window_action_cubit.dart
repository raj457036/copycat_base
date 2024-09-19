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

enum AppView {
  topDocked,
  bottomDocked,
  leftDocked,
  rightDocked,
  windowed,
}

@injectable
class WindowActionCubit extends Cubit<WindowActionState> {
  Display? primaryDisplay;
  bool isCompactMode = false;
  bool isFocused = false;

  WindowActionCubit() : super(const WindowActionState.loaded());

  double get displayHeight {
    if (primaryDisplay != null) {
      final height = primaryDisplay?.visibleSize?.height ??
          primaryDisplay!.size.height -
              (primaryDisplay?.visiblePosition?.dy ?? 0);
      return height;
    }
    return initialWindowSize.height;
  }

  double get displayWidth {
    if (primaryDisplay != null) {
      final width = primaryDisplay?.visibleSize?.width ??
          primaryDisplay!.size.width -
              (primaryDisplay?.visiblePosition?.dx ?? 0);
      return width;
    }
    return initialWindowSize.width;
  }

  Future<void> fetch() async {
    await setupScreenInfo();
    await setWindowdView();
  }

  Future<void> setupScreenInfo() async {
    primaryDisplay = await screenRetriever.getPrimaryDisplay();
    isFocused = await windowManager.isFocused();
    emit(
      const WindowActionState.loaded(loading: false),
    );
  }

  Future<void> setDockedView(AppView view) async {
    assert(view != AppView.windowed, "Only docked views allowed");

    final Alignment alignment = switch (view) {
      AppView.leftDocked => Alignment.centerLeft,
      AppView.rightDocked => Alignment.topRight,
      AppView.topDocked => Alignment.topCenter,
      AppView.bottomDocked => Alignment.bottomCenter,
      _ => Alignment.center,
    };

    final Size dockedMaxSize = switch (view) {
      AppView.leftDocked || AppView.rightDocked => Size(
          dockedLRMaxWidth,
          displayHeight,
        ),
      AppView.topDocked ||
      AppView.bottomDocked =>
        Size(displayWidth, dockedTBMaxHeight),
      _ => initialWindowSize,
    };

    final Size dockedMinSize = switch (view) {
      AppView.leftDocked || AppView.rightDocked => Size(
          dockedLRMinWidth,
          displayHeight,
        ),
      AppView.topDocked ||
      AppView.bottomDocked =>
        Size(displayWidth, dockedTBMinHeight),
      _ => initialWindowSize,
    };

    final position = await calcWindowPosition(dockedMaxSize, alignment);
    await windowManager.setSize(dockedMaxSize);
    await windowManager.setPosition(position, animate: true);
    windowManager.setMinimumSize(dockedMinSize);
    windowManager.setMaximumSize(dockedMaxSize);
    windowManager.setMovable(false);
    windowManager.setAsFrameless();
    windowManager.setAlwaysOnTop(true);
    emit(state.copyWith(view: view));
  }

  Future<void> setWindowdView() async {
    await windowManager.setSize(initialWindowSize);
    await windowManager.center(animate: true);
    await windowManager.setMinimumSize(minimumWindowSize);
    await windowManager.setMovable(true);
    windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    windowManager.setAlwaysOnTop(false);
    emit(state.copyWith(view: AppView.windowed));
  }

  Future<void> hide({bool animated = false}) async {
    if (state.view == AppView.windowed) {
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
    }
    await windowManager.hide();
    isFocused = false;
  }

  Future<void> show({bool animated = false}) async {
    if (state.view == AppView.windowed) {}
    await windowManager.show();
    await windowManager.focus();
    isFocused = true;
  }
}
