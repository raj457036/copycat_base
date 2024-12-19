import "package:android_background_clipboard/android_background_clipboard.dart";
import "package:copycat_base/constants/strings/strings.dart";
import "package:copycat_base/db/app_config/appconfig.dart";
import "package:copycat_base/db/clip_collection/clipcollection.dart";
import "package:copycat_base/db/clipboard_item/clipboard_item.dart";
import "package:copycat_base/db/subscription/subscription.dart";
import "package:copycat_base/db/sync_status/syncstatus.dart";
import "package:copycat_base/utils/utility.dart";
import 'package:device_info_plus/device_info_plus.dart';
import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";
import "package:isar/isar.dart";
import 'package:path/path.dart' as p;
import "package:path_provider/path_provider.dart";
import "package:tiny_storage/tiny_storage.dart";
import "package:universal_io/io.dart";

@module
abstract class RegisterModule {
  @preResolve
  @singleton
  Future<TinyStorage> localCache() async {
    final appDir = await getApplicationDocumentsDirectory();
    final cacheDir = p.join(appDir.path, "cache");
    final storage = await TinyStorage.init("local_cache.json", path: cacheDir);
    return storage;
  }

  @preResolve
  @LazySingleton(dispose: closeIsarDb)
  Future<Isar> get db async {
    final dir = await getApplicationDocumentsDirectory();

    final isar = await Isar.open(
      [
        ClipboardItemSchema,
        AppConfigSchema,
        SyncStatusSchema,
        ClipCollectionSchema,
        SubscriptionSchema,
      ],
      directory: dir.path,
      relaxedDurability: true,
      inspector: kDebugMode,
      name: dbName,
    );
    return isar;
  }

  @preResolve
  @Named("device_id")
  Future<String> deviceId(TinyStorage cache) async {
    const deviceIdKey = r"$$DEVICE_ID_KEY$$";
    final deviceInfo = DeviceInfoPlugin();

    String? platformDeviceId;

    if (Platform.isAndroid) {
      platformDeviceId = (await deviceInfo.androidInfo).id;
    } else if (Platform.isIOS) {
      platformDeviceId = (await deviceInfo.iosInfo).identifierForVendor;
    } else if (Platform.isMacOS) {
      platformDeviceId = (await deviceInfo.macOsInfo).systemGUID;
    } else if (Platform.isWindows) {
      platformDeviceId = (await deviceInfo.windowsInfo).deviceId;
    } else if (Platform.isLinux) {
      platformDeviceId = (await deviceInfo.linuxInfo).machineId;
    }

    String? deviceId_ = (platformDeviceId ?? cache.get<String?>(deviceIdKey));
    if (deviceId_ == null) {
      final id_ = getId();
      cache.set(deviceIdKey, id_);
      deviceId_ = id_;
    }

    return deviceId_;
  }

  @LazySingleton()
  AndroidBackgroundClipboard get bgService =>
      const AndroidBackgroundClipboard();
}

Future<void> closeIsarDb(Isar db) async {
  await db.close();
}
