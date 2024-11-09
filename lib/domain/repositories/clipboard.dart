import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/paginated_results.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/sources/clipboard.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/enums/sort.dart';

abstract class ClipboardRepository {
  FailureOr<ClipboardItem?> get({int? id, int? serverId});
  FailureOr<ClipboardItem> create(ClipboardItem item);

  FailureOr<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
    Set<TextCategory>? category,
    Set<ClipItemType>? types,
    int? collectionId,
    ClipboardSortKey? sortBy,
    SortOrder order = SortOrder.desc,
    DateTime? from,
    DateTime? to,
  });

  FailureOr<ClipboardItem> update(ClipboardItem item);
  FailureOr<ClipboardItem> updateOrCreate(ClipboardItem item);

  FailureOr<bool> delete(ClipboardItem item);
  FailureOr<List<ClipboardItem>> deleteMany(List<ClipboardItem> items);

  FailureOr<void> deleteAll();

  FailureOr<ClipboardItem?> getLatest({bool? synced});

  FailureOr<void> decryptPending();
}
