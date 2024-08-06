part of 'focused_clipitem_cubit.dart';

@freezed
class FocusedClipitemState with _$FocusedClipitemState {
  const factory FocusedClipitemState.unfocused() = UnfocusedClipItem;
  const factory FocusedClipitemState.focused(ClipboardItem item) =
      FocusedClipItem;
}
