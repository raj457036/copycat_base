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
  Future<ClipboardItem?> get({int? id, int? serverId});
  Future<ClipboardItem> create(ClipboardItem item);

  Future<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
    Set<TextCategory>? textCategories,
    Set<ClipItemType>? types,
    int? collectionId,
    ClipboardSortKey? sortBy,
    SortOrder order = SortOrder.desc,
    DateTime? from,
    DateTime? to,
  });

  Future<ClipboardItem> update(ClipboardItem item);

  Future<ClipboardItem> updateOrCreate(ClipboardItem item);

  Future<bool> delete(ClipboardItem item);
  Future<List<ClipboardItem>> deleteMany(List<ClipboardItem> items);

  Future<void> deleteAll();

  Future<ClipboardItem?> getLatestFromOthers({bool? synced});

  Future<void> decryptPending();

  Future<void> deleteAllEncrypted();

  Future<int> getClipCounts();
}
