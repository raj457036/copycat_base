// ignore_for_file: invalid_use_of_protected_member

import 'package:copycat_base/common/paginated_results.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/sources/clipboard.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/enums/sort.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Named("local")
@LazySingleton(as: ClipboardSource)
class LocalClipboardSource implements ClipboardSource {
  final Isar db;

  LocalClipboardSource(this.db);

  @override
  Future<ClipboardItem> create(ClipboardItem item) async {
    final id = await db.writeTxn(() => db.clipboardItems.put(item));
    item.id = id;
    return item;
  }

  @override
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
  }) async {
    QueryBuilder<ClipboardItem, ClipboardItem, QFilterCondition> resultsQuery;

    if (search == null && collectionId == null) {
      resultsQuery = db.clipboardItems.filter();
    } else {
      resultsQuery = db.clipboardItems.filter();

      if (collectionId != null) {
        resultsQuery = resultsQuery.collectionIdEqualTo(collectionId);
      } else {
        resultsQuery = resultsQuery.encryptedEqualTo(false);
      }

      for (final word in Isar.splitWords(search ?? "")) {
        resultsQuery = resultsQuery.group((q) => q
            .titleContains(word, caseSensitive: false)
            .or()
            .descriptionContains(word, caseSensitive: false)
            .or()
            .urlContains(word, caseSensitive: false)
            .or()
            .textContains(word, caseSensitive: false)
            .or()
            .fileMimeTypeContains(word, caseSensitive: false));
      }
    }

    if (types != null) {
      resultsQuery = resultsQuery.anyOf(
        types,
        (q, type) => q.typeEqualTo(type),
      );
    }

    if (from != null && to != null) {
      resultsQuery = resultsQuery.createdBetween(from, to);
    } else if (from != null) {
      resultsQuery = resultsQuery.createdGreaterThan(from, include: true);
    } else if (to != null) {
      resultsQuery = resultsQuery.createdLessThan(to, include: true);
    }

    if (textCategories != null) {
      resultsQuery = resultsQuery.anyOf(
        textCategories,
        (q, category) => q.textCategoryEqualTo(category),
      );
    }

    var query = resultsQuery.deletedAtIsNull();

    QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortedQuery;

    switch (sortBy) {
      case ClipboardSortKey.modified:
        sortedQuery =
            order.isDesc ? query.sortByModifiedDesc() : query.sortByModified();

      case ClipboardSortKey.lastCopied:
        sortedQuery = order.isDesc
            ? query.sortByLastCopiedDesc()
            : query.sortByLastCopied();

      case ClipboardSortKey.copyCount:
        sortedQuery = order.isDesc
            ? query.sortByCopiedCountDesc()
            : query.sortByCopiedCount();

      case ClipboardSortKey.created:
      case _:
        sortedQuery =
            order.isDesc ? query.sortByCreatedDesc() : query.sortByCreated();
    }

    var paginatedQuery = sortedQuery.offset(offset).limit(limit).findAll();

    final results = await db.txn(() async => await paginatedQuery);

    return PaginatedResult(
      results: results,
      hasMore: results.length == limit,
    );
  }

  @override
  Future<ClipboardItem> update(ClipboardItem item) async {
    final updated = item.copyWith(
      modified: now(),
    )..applyId(item);
    await db.writeTxn(
      () => db.clipboardItems.put(updated),
    );
    return updated;
  }

  @override
  Future<bool> delete(ClipboardItem item) async {
    final result = await db.writeTxn(() => db.clipboardItems.delete(item.id));
    return result;
  }

  @override
  Future<void> deleteAll() async {
    await db.writeTxn(() => db.clipboardItems.clear());
  }

  @override
  Future<ClipboardItem?> get({int? id, String? serverId}) async {
    if (id == null) return null;
    final result = await db.txn(() => db.clipboardItems.get(id));
    return result;
  }

  @override
  Future<ClipboardItem?> getLatest() async {
    final result = await db
        .txn(() => db.clipboardItems.where().sortByModifiedDesc().findFirst());
    return result;
  }

  @override
  Future<void> decryptPending() async {
    await db.writeTxn(() async {
      const limit = 50;

      while (true) {
        final items = await db.clipboardItems
            .filter()
            .encryptedEqualTo(true)
            .limit(limit)
            .findAll();
        if (items.isEmpty) break;
        final decrypted = await Future.wait(
          items.map((item) => item.decrypt()),
        );
        await db.clipboardItems.putAll(decrypted);
        if (items.length < limit) break;
      }
    });
  }

  @override
  Future<bool> deleteMany(List<ClipboardItem> items) async {
    final result = await db.writeTxn(
      () => db.clipboardItems
          .filter()
          .anyOf(
            items,
            (q, item) => q.idEqualTo(item.id),
          )
          .deleteAll(),
    );
    return result == items.length;
  }
}
