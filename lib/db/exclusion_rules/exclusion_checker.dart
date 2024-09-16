import 'package:copycat_base/db/exclusion_rules/exclusion_rules.dart';
import 'package:copycat_base/db/exclusion_rules/sensitive_info.dart';
import 'package:focus_window/platform/activity_info.dart';

class ExclusionChecker {
  final List<String> _titles = [];
  final List<String> _urls = [];
  final List<RegExp> _patterns = [];
  final List<AppInfo> _apps = [];

  ExclusionChecker({
    ExclusionRules? rules,
    bool includeDefaults = false,
  }) {
    if (rules == null) return;
    _titles.addAll(rules.titles);
    _urls.addAll(rules.urls);
    _patterns.addAll(rules.patterns.map((e) => RegExp(e)));
    _apps.addAll(rules.apps);
    if (includeDefaults) {
      _titles.addAll(defaultExcludedTitles);
      _urls.addAll(defaultExcludedUrl);
      _patterns.addAll(defaultExcludedPatterns);
      _apps.addAll(defaultExcludedApps);
    }
  }

  bool isContentAllowed(String text) {
    return !_patterns.any((pattern) => pattern.hasMatch(text));
  }

  bool isActivityAllowed(ActivityInfo activity) {
    if (activity.title.isNotEmpty &&
        _titles.contains(activity.title.toLowerCase())) {
      return false;
    }
    if (activity.url.isNotEmpty && _urls.contains(activity.url.toLowerCase())) {
      return false;
    }

    for (final app in _apps) {
      if (app.identifier != null && activity.identifier == app.identifier!) {
        return false;
      }
      if (activity.appFileName.startsWith(app.name)) return false;
      if (app.path != null && activity.appFilePath.endsWith(app.path!)) {
        return false;
      }
    }

    return true;
  }
}
