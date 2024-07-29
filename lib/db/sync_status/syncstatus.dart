import 'package:copycat_base/db/base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'syncstatus.freezed.dart';
part 'syncstatus.g.dart';

@freezed
@Collection(ignore: {"copyWith"})
class SyncStatus with _$SyncStatus, IsarIdMixin {
  SyncStatus._();
  factory SyncStatus({DateTime? lastSync}) = _SyncStatus;
}
