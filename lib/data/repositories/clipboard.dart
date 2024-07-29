import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/paginated_results.dart';
import 'package:copycat_base/data/sources/clipboard.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/enums/sort.dart';

abstract class ClipboardRepository {
  FailureOr<ClipboardItem?> get({int? id, String? serverId});
  FailureOr<ClipboardItem> create(ClipboardItem item);

  FailureOr<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
    List<String>? category,
    List<ClipItemType>? types,
    int? collectionId,
    ClipboardSortKey? sortBy,
    SortOrder order = SortOrder.desc,
  });

  FailureOr<ClipboardItem> update(ClipboardItem item);

  FailureOr<bool> delete(ClipboardItem item);

  FailureOr<void> deleteAll();

  FailureOr<ClipboardItem?> getLatest();

  FailureOr<void> decryptPending();
}
