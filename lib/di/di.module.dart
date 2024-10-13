//@GeneratedMicroModule;CopycatBasePackageModule;package:copycat_base/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart'
    as _i411;
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart' as _i630;
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart'
    as _i402;
import 'package:copycat_base/bloc/clipboard_cubit/clipboard_cubit.dart'
    as _i189;
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart'
    as _i691;
import 'package:copycat_base/bloc/collection_clips_cubit/collection_clips_cubit.dart'
    as _i1054;
import 'package:copycat_base/bloc/drive_setup_cubit/drive_setup_cubit.dart'
    as _i746;
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i768;
import 'package:copycat_base/bloc/selected_clips_cubit/selected_clips_cubit.dart'
    as _i443;
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart'
    as _i11;
import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart'
    as _i617;
import 'package:copycat_base/data/repositories/analytics.dart' as _i55;
import 'package:copycat_base/data/repositories/app_config.dart' as _i228;
import 'package:copycat_base/data/repositories/clip_collection.dart' as _i834;
import 'package:copycat_base/data/repositories/clipboard.dart' as _i122;
import 'package:copycat_base/data/repositories/sync_clipboard.dart' as _i421;
import 'package:copycat_base/data/services/clipboard_service.dart' as _i354;
import 'package:copycat_base/data/services/google_drive_service.dart' as _i872;
import 'package:copycat_base/data/services/google_services.dart' as _i1054;
import 'package:copycat_base/data/sources/clip_collection/local_source.dart'
    as _i799;
import 'package:copycat_base/data/sources/clipboard/local_source.dart' as _i397;
import 'package:copycat_base/db/clip_collection/clipcollection.dart' as _i531;
import 'package:copycat_base/di/modules.dart' as _i50;
import 'package:copycat_base/domain/repositories/analytics.dart' as _i860;
import 'package:copycat_base/domain/repositories/app_config.dart' as _i854;
import 'package:copycat_base/domain/repositories/auth.dart' as _i281;
import 'package:copycat_base/domain/repositories/clip_collection.dart' as _i625;
import 'package:copycat_base/domain/repositories/clipboard.dart' as _i72;
import 'package:copycat_base/domain/repositories/drive_credential.dart'
    as _i447;
import 'package:copycat_base/domain/repositories/sync_clipboard.dart' as _i106;
import 'package:copycat_base/domain/sources/clip_collection.dart' as _i569;
import 'package:copycat_base/domain/sources/clipboard.dart' as _i191;
import 'package:copycat_base/domain/sources/sync_clipboard.dart' as _i903;
import 'package:injectable/injectable.dart' as _i526;
import 'package:isar/isar.dart' as _i338;
import 'package:tiny_storage/tiny_storage.dart' as _i829;

class CopycatBasePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final registerModule = _$RegisterModule();
    gh.factory<_i443.SelectedClipsCubit>(() => _i443.SelectedClipsCubit());
    gh.factory<_i617.WindowActionCubit>(() => _i617.WindowActionCubit());
    await gh.singletonAsync<_i829.TinyStorage>(
      () => registerModule.localCache(),
      preResolve: true,
    );
    gh.singleton<_i354.ClipboardService>(() => _i354.ClipboardService());
    await gh.lazySingletonAsync<_i338.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i50.closeIsarDb,
    );
    gh.lazySingleton<_i872.GoogleOAuth2Service>(
        () => _i872.GoogleOAuth2Service());
    gh.lazySingleton<_i854.AppConfigRepository>(
        () => _i228.AppConfigRepositoryImpl(gh<_i338.Isar>()));
    gh.lazySingleton<_i860.AnalyticsRepository>(
        () => const _i55.AnalyticsRepositoryImpl());
    gh.lazySingleton<_i106.SyncRepository>(() => _i421.SyncRepositoryImpl(
        gh<_i903.SyncClipboardSource>(instanceName: 'remote')));
    await gh.factoryAsync<String>(
      () => registerModule.deviceId,
      instanceName: 'device_id',
      preResolve: true,
    );
    gh.lazySingleton<_i569.ClipCollectionSource>(
      () => _i799.LocalClipCollectionSource(gh<_i338.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i1054.DriveService>(
      () => _i872.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.lazySingleton<_i191.ClipboardSource>(
      () => _i397.LocalClipboardSource(gh<_i338.Isar>()),
      instanceName: 'local',
    );
    gh.singleton<_i411.AppConfigCubit>(
        () => _i411.AppConfigCubit(gh<_i854.AppConfigRepository>()));
    gh.lazySingleton<_i72.ClipboardRepository>(
      () => _i122.ClipboardRepositoryOfflineImpl(
          gh<_i191.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i72.ClipboardRepository>(
      () => _i122.ClipboardRepositoryCloudImpl(
          gh<_i191.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.lazySingleton<_i625.ClipCollectionRepository>(
        () => _i834.ClipCollectionRepositoryImpl(
              gh<_i569.ClipCollectionSource>(instanceName: 'remote'),
              gh<_i569.ClipCollectionSource>(instanceName: 'local'),
            ));
    gh.singleton<_i630.AuthCubit>(() => _i630.AuthCubit(
          gh<_i281.AuthRepository>(),
          gh<_i829.TinyStorage>(),
          gh<_i860.AnalyticsRepository>(),
        ));
    gh.singleton<_i11.SyncManagerCubit>(() => _i11.SyncManagerCubit(
          gh<_i338.Isar>(),
          gh<_i630.AuthCubit>(),
          gh<_i106.SyncRepository>(),
          gh<_i625.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.lazySingleton<_i402.ClipCollectionCubit>(() => _i402.ClipCollectionCubit(
          gh<_i630.AuthCubit>(),
          gh<_i625.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.factoryParam<_i1054.CollectionClipsCubit, _i531.ClipCollection, dynamic>(
        (
      collection,
      _,
    ) =>
            _i1054.CollectionClipsCubit(
              gh<_i72.ClipboardRepository>(instanceName: 'offline'),
              collection: collection,
            ));
    gh.lazySingleton<_i746.DriveSetupCubit>(() => _i746.DriveSetupCubit(
          gh<_i447.DriveCredentialRepository>(),
          gh<_i1054.DriveService>(instanceName: 'google_drive'),
        ));
    gh.factory<_i189.ClipboardCubit>(() => _i189.ClipboardCubit(
          gh<_i72.ClipboardRepository>(instanceName: 'offline'),
          gh<_i338.Isar>(),
        ));
    gh.lazySingleton<_i768.OfflinePersistanceCubit>(
        () => _i768.OfflinePersistanceCubit(
              gh<_i630.AuthCubit>(),
              gh<_i72.ClipboardRepository>(instanceName: 'offline'),
              gh<_i354.ClipboardService>(),
              gh<_i411.AppConfigCubit>(),
              gh<_i860.AnalyticsRepository>(),
              gh<String>(instanceName: 'device_id'),
            ));
    gh.lazySingleton<_i691.CloudPersistanceCubit>(
        () => _i691.CloudPersistanceCubit(
              gh<_i630.AuthCubit>(),
              gh<_i746.DriveSetupCubit>(),
              gh<_i411.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
              gh<_i72.ClipboardRepository>(instanceName: 'cloud'),
            ));
  }
}

class _$RegisterModule extends _i50.RegisterModule {}
