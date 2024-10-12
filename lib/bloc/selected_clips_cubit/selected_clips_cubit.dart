import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'selected_clips_cubit.freezed.dart';
part 'selected_clips_state.dart';

@injectable
class SelectedClipsCubit extends Cubit<SelectedClipsState> {
  SelectedClipsCubit() : super(const SelectedClipsState.noClipSelected());

  void select(int clipId) {
    switch (state) {
      case NoClipSelected():
        emit(SelectedClipsState.clipSelected(selectedClipIds: {clipId}));
      case ClipSelected(:final selectedClipIds):
        {
          final newSelectedClipIds = {...selectedClipIds, clipId};
          emit(SelectedClipsState.clipSelected(
              selectedClipIds: newSelectedClipIds));
        }
    }
  }

  void unselect(int clipId) {
    switch (state) {
      case ClipSelected(:final selectedClipIds):
        if (selectedClipIds.contains(clipId)) {
          final newSelectedClipIds = {...selectedClipIds}..remove(clipId);
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

  bool isSelected(int clipId) {
    return switch (state) {
      NoClipSelected() => false,
      ClipSelected(:final selectedClipIds) => selectedClipIds.contains(clipId)
    };
  }
}
