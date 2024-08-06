import 'package:bloc/bloc.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'focused_clipitem_cubit.freezed.dart';
part 'focused_clipitem_state.dart';

@lazySingleton
class FocusedClipitemCubit extends Cubit<FocusedClipitemState> {
  FocusedClipitemCubit() : super(const FocusedClipitemState.unfocused());

  void focused(ClipboardItem item) {
    emit(FocusedClipitemState.focused(item));
  }

  void unfocus() => emit(const FocusedClipitemState.unfocused());
}
