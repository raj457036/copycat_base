import 'package:copycat_base/common/paginated_results.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/enums/sort.dart';

enum ClipboardSortKey {
  created,
  modified,
  lastCopied,
  copyCount,
}

abstract class ClipboardSource {
  Future<ClipboardItem?> get({int? id, String? serverId});
  Future<ClipboardItem> create(ClipboardItem item);

  Future<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
    List<String>? category,
    List<ClipItemType>? types,
    int? collectionId,
    ClipboardSortKey? sortBy,
    SortOrder order = SortOrder.desc,
    DateTime? from,
    DateTime? to,
  });

  Future<ClipboardItem> update(ClipboardItem item);

  Future<bool> delete(ClipboardItem item);

  Future<void> deleteAll();

  Future<ClipboardItem?> getLatest();

  Future<void> decryptPending();
}
