import 'package:bloc/bloc.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'selected_clips_cubit.freezed.dart';
part 'selected_clips_state.dart';

@injectable
class SelectedClipsCubit extends Cubit<SelectedClipsState> {
  SelectedClipsCubit() : super(const SelectedClipsState.noClipSelected());

  void select(ClipboardItem clip) {
    switch (state) {
      case NoClipSelected():
        emit(SelectedClipsState.clipSelected(selectedClipIds: {clip}));
      case ClipSelected(:final selectedClipIds):
        {
          final newSelectedClipIds = {...selectedClipIds, clip};
          emit(SelectedClipsState.clipSelected(
              selectedClipIds: newSelectedClipIds));
        }
    }
  }

  void unselect(ClipboardItem clip) {
    switch (state) {
      case ClipSelected(:final selectedClipIds):
        if (selectedClipIds.contains(clip)) {
          final newSelectedClipIds = {...selectedClipIds}..remove(clip);
          if (newSelectedClipIds.isEmpty) {
            emit(const SelectedClipsState.noClipSelected());
            return;
          }
          emit(SelectedClipsState.clipSelected(
              selectedClipIds: newSelectedClipIds));
        }
      case _:
    }
  }

  void clear() {
    emit(const SelectedClipsState.noClipSelected());
  }

  bool isSelected(ClipboardItem clip) {
    return switch (state) {
      NoClipSelected() => false,
      ClipSelected(:final selectedClipIds) => selectedClipIds.contains(clip)
    };
  }
}
