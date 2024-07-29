import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/paginated_results.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';

abstract class ClipCollectionRepository {
  FailureOr<ClipCollection?> get({int? id, int? serverId});
  FailureOr<ClipCollection> create(ClipCollection collection);

  FailureOr<PaginatedResult<ClipCollection>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
    bool fromServer = false,
  });

  FailureOr<ClipCollection> update(ClipCollection collection);

  FailureOr<bool> delete(ClipCollection collection);

  FailureOr<void> deleteAll();
}
