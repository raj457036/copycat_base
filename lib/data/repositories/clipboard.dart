import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/paginated_results.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/domain/sources/clipboard.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/enums/sort.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Named("cloud")
@LazySingleton(as: ClipboardRepository)
class ClipboardRepositoryCloudImpl implements ClipboardRepository {
  final ClipboardSource remote;

  ClipboardRepositoryCloudImpl(
    @Named("remote") this.remote,
  );

  @override
  FailureOr<ClipboardItem> create(ClipboardItem item) async {
    try {
      item = item.copyWith(modified: now())..applyId(item);
      final encrypted = await item.encrypt();
      final result = await remote.create(encrypted);
      final clip = item.copyWith(
        serverId: result.serverId,
        lastSynced: result.lastSynced,
      )..applyId(result);
      return Right(clip);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
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
  }) async {
    try {
      final result = await remote.getList(
        limit: limit,
        offset: offset,
        collectionId: collectionId,
        sortBy: sortBy,
        order: order,
        search: search,
        types: types,
        textCategories: category,
        from: from,
        to: to,
      );
      final decryptedItems = await Future.wait(
        result.results.map(
          (e) => e.decrypt(),
        ),
      );

      return Right(
        PaginatedResult(
          results: decryptedItems,
          hasMore: result.hasMore,
        ),
      );
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem> update(ClipboardItem item) async {
    try {
      item = item.copyWith(modified: now())..applyId(item);
      final encrypted = await item.encrypt();
      final result = await remote.update(encrypted);
      final clip = item.copyWith(
        lastSynced: now(),
      )..applyId(result);
      return Right(clip);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<bool> delete(ClipboardItem item) async {
    try {
      await remote.delete(item);
      return const Right(true);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> deleteAll() async {
    // no-op
    return const Right(null);
  }

  @override
  FailureOr<ClipboardItem?> get({int? id, String? serverId}) async {
    try {
      final result = await remote.get(serverId: serverId);
      final decrypted = await result?.decrypt();
      return Right(decrypted);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem?> getLatest() {
    throw UnimplementedError();
  }

  @override
  FailureOr<void> decryptPending() {
    throw UnimplementedError();
  }

  @override
  FailureOr<bool> deleteMany(List<ClipboardItem> items) async {
    try {
      await remote.deleteMany(items);
      return const Right(true);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}

@Named("offline")
@LazySingleton(as: ClipboardRepository)
class ClipboardRepositoryOfflineImpl implements ClipboardRepository {
  final ClipboardSource local;

  ClipboardRepositoryOfflineImpl(
    @Named("local") this.local,
  );

  @override
  FailureOr<ClipboardItem> create(ClipboardItem item) async {
    try {
      final result = await local.create(item);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
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
  }) async {
    try {
      final result = await local.getList(
        limit: limit,
        offset: offset,
        search: search,
        types: types,
        textCategories: category,
        collectionId: collectionId,
        sortBy: sortBy,
        order: order,
        from: from,
        to: to,
      );

      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem> update(ClipboardItem item) async {
    try {
      final result = await local.update(item);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<bool> delete(ClipboardItem item) async {
    try {
      await local.delete(item);
      return const Right(true);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> deleteAll() async {
    try {
      await local.deleteAll();
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem?> get({int? id, String? serverId}) async {
    try {
      final result = await local.get(id: id);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem?> getLatest() async {
    try {
      final result = await local.getLatest();
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> decryptPending() async {
    try {
      await local.decryptPending();
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<bool> deleteMany(List<ClipboardItem> items) async {
    try {
      await local.deleteMany(items);
      return const Right(true);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
