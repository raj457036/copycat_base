import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';

abstract class AppConfigRepository {
  FailureOr<AppConfig> get();
  FailureOr<AppConfig> update(AppConfig config);
}
