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

  db.writeTxnSync(() {
    final foundItems = db.clipboardItems
        .filter()
        .anyOf(items, (q, _) => q.serverIdEqualTo(_.serverId))
        .findAllSync();

    for (var found in foundItems) {
      final index = items.indexWhere((item) => item.serverId == found.serverId);
      if (index != -1) {
        items[index] = items[index].copyWith(
          lastSynced: found.lastSynced,
          localPath: found.localPath,
        )..applyId(found);
      }
    }
    db.clipboardItems.putAllSync(items);
    foundedCount = foundItems.length;
  });

  send(foundedCount);
}
