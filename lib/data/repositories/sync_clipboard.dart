import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/paginated_results.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';

abstract class SyncRepository {
  FailureOr<PaginatedResult<ClipCollection>> getLatestClipCollections({
    required String userId,
    int limit = 100,
    int offset = 0,
    String? excludeDeviceId,
    DateTime? lastSynced,
  });

  FailureOr<PaginatedResult<ClipboardItem>> getLatestClipboardItems({
    required String userId,
    int limit = 100,
    int offset = 0,
    String? excludeDeviceId,
    DateTime? lastSynced,
  });

  FailureOr<PaginatedResult<ClipCollection>> getDeletedClipCollections({
    required String userId,
    int limit = 100,
    int offset = 0,
    String? excludeDeviceId,
    DateTime? lastSynced,
  });

  FailureOr<PaginatedResult<ClipboardItem>> getDeletedClipboardItems({
    required String userId,
    int limit = 100,
    int offset = 0,
    String? excludeDeviceId,
    DateTime? lastSynced,
  });
}
