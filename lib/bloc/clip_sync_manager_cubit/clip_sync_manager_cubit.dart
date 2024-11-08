import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clip_sync_manager_cubit.freezed.dart';
part 'clip_sync_manager_state.dart';

class ClipSyncManagerCubit extends Cubit<ClipSyncManagerState> {
  ClipSyncManagerCubit() : super(const ClipSyncManagerState.initial());
}
