import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/db/sync_status/syncstatus.dart';

abstract class RestorationStatusRepository {
  FailureOr<SyncStatus?> getStatus();
  FailureOr<SyncStatus> setStatus(SyncStatus status);
}
