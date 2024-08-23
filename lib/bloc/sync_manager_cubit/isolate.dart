import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:easy_worker/easy_worker.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void syncingClips(
  List<ClipboardItem> items,
  Sender send,
) async {
  final Isar db;
  final instance = Isar.getInstance("CopyCat-Clipboard-DB");
  if (instance != null) {
    db = instance;
  } else {
    final dir = await getApplicationDocumentsDirectory();
    db = Isar.openSync(
      [ClipboardItemSchema],
      directory: dir.path,
      relaxedDurability: true,
      inspector: kDebugMode,
      name: "CopyCat-Clipboard-DB",
    );
  }

  int foundedCount = 0;

  await db.txn(() async {
    for (var index = 0; index < items.length; index++) {
      final item = items[index];
      final found = await db.clipboardItems
          .filter()
          .serverIdEqualTo(item.serverId)
          .findFirst();

      if (found == null) {
        continue;
      }

      foundedCount++;
      items[index] = item.copyWith(
        lastSynced: found.lastSynced,
        localPath: found.localPath,
      )..applyId(found);
    }
  });

  await db.writeTxn(() async {
    await db.clipboardItems.putAll(items);
  });

  send(foundedCount);
}
