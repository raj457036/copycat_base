import 'package:copycat_base/bloc/android_bg_clipboard_cubit/android_bg_clipboard_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AndroidBgClipboardStateListener extends StatefulWidget {
  final Widget child;

  const AndroidBgClipboardStateListener({super.key, required this.child});

  @override
  State<AndroidBgClipboardStateListener> createState() =>
      _AndroidBgClipboardStateListenerState();
}

class _AndroidBgClipboardStateListenerState
    extends State<AndroidBgClipboardStateListener> with WidgetsBindingObserver {
  late final AndroidBgClipboardCubit androidBgClipboardCubit;

  @override
  void initState() {
    super.initState();
    androidBgClipboardCubit = context.read();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      androidBgClipboardCubit.syncStates();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
