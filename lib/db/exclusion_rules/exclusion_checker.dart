import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/data/services/clipboard_service.dart';
import 'package:copycat_base/db/exclusion_rules/exclusion_rules.dart';
import 'package:copycat_base/db/exclusion_rules/sensitive_info.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:focus_window/platform/activity_info.dart';

// patterns
final _creditCardPattern = RegExp(r'\b\d{4} \d{4} \d{4} \d{4}\b');
// Regex to match a combination of letters, digits, and special characters
final passwordPattern =
    RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+=-]).{8,}$');
// Exclude patterns that are likely not passwords (e.g., hex colors, common words)
final commonWordPattern = RegExp(r'^[a-zA-Z]+$'); // Only alphabets, like a word
final hexPattern = RegExp(r'^#?[A-Fa-f0-9]{6}$'); // Hex color pattern
final otpPattern = RegExp(r'^\d{4,6}$'); // OTP pattern

// Bank account number pattern (6-18 digits or IBAN format 15-34 alphanumeric)
final bankAccountPattern = RegExp(r'^\d{6,18}$|^[A-Z]{2}\d{2}[A-Z0-9]{11,30}$');

// Generic passport number pattern (6-9 alphanumeric characters)
final passportPattern = RegExp(r'^[A-Z0-9]{6,9}$');

class ExclusionChecker {
  final List<RegExp> _rTitle = [];
  final List<RegExp> _rUrls = [];
  // final List<String> _titles;
  // final List<String> _urls;
  final List<RegExp> _patterns;
  final List<AppInfo> _apps;
  final bool _creditCard;
  final bool _phone;
  final bool _passwordManager;
  final bool _passwords;
  final bool _email;
  final bool _bankAccount;
  final bool _personalInfo;
  final bool _sensitiveUrls;

  ExclusionChecker(
    ExclusionRules rules,
  )   :
        // _titles = [...rules.titles],
        //       _urls = [...rules.urls],
        _patterns = rules.patterns.map((e) => RegExp(e)).toList(),
        _apps = [...rules.apps],
        _creditCard = rules.creditCard,
        _phone = rules.phone,
        _passwordManager = rules.passwordManager,
        _passwords = rules.passwords,
        _email = rules.email,
        _bankAccount = rules.bankAccount,
        _personalInfo = rules.personalInfo,
        _sensitiveUrls = rules.sensitiveUrls {
    if (_sensitiveUrls) {
      _rUrls.add(
        RegExp(
          sensitiveUrlKeywords.join("|"),
          caseSensitive: false,
          multiLine: true,
        ),
      );

      _rTitle.add(
        RegExp(
          sensitiveTitlesKeywords.join("|"),
          caseSensitive: false,
          multiLine: true,
        ),
      );
    }

    if (rules.titles.isNotEmpty) {
      _rTitle.add(RegExp(
        rules.titles.join("|"),
        caseSensitive: false,
        multiLine: true,
      ));
    }

    if (rules.urls.isNotEmpty) {
      _rUrls.add(RegExp(
        rules.urls.join("|"),
        caseSensitive: false,
        multiLine: true,
      ));
    }

    if (_passwordManager) {
      _apps.addAll(sensitiveExcludedApps);
    }
  }

  bool isPossiblePassword(String text) {
    // If text matches the password pattern and does not match excluded patterns
    if (passwordPattern.hasMatch(text) &&
        !commonWordPattern.hasMatch(text) &&
        !hexPattern.hasMatch(text) &&
        !otpPattern.hasMatch(text)) {
      return true; // Most likely a password
    }

    return false; // Not a password
  }

  bool isClipAllowed(ClipItem clip, ActivityInfo? activity) {
    logger.w("Excluded pattern detected in content");
    if (clip.isText) {
      if (_phone && clip.textCategory == TextCategory.phone) {
        logger.w("Detected Phone");
        return false;
      }
      if (_email && clip.textCategory == TextCategory.email) {
        logger.w("Detected Email");
        return false;
      }

      if (_creditCard) {
        return !_creditCardPattern.hasMatch(clip.text!);
      }

      if (_passwords) {
        return !isPossiblePassword(clip.text!);
      }
      if (_bankAccount) {
        return !bankAccountPattern.hasMatch(clip.text!);
      }
      if (_personalInfo) {
        return !passportPattern.hasMatch(clip.text!);
      }
    }
    if (_sensitiveUrls) {
      final p0 = activity != null ? isActivityAllowed(activity) : true;
      if (clip.isUri) {
        final p1 = !_rUrls.any((r) => clip.uri!.toString().contains(r));
        return p1 && p0;
      }
      return p0;
    }

    if (_creditCard) {
      return !_patterns.any((pattern) => pattern.hasMatch(clip.text!));
    }
    return true;
  }

  bool isActivityAllowed(ActivityInfo activity) {
    if (activity.title.isNotEmpty) {
      final hasMatch = _rTitle.any((r) => activity.title.contains(r));
      if (hasMatch) {
        logger.w("Excluded pattern detected in title");
        return false;
      }
    }
    if (activity.url.isNotEmpty) {
      final hasMatch = _rUrls.any((r) => activity.url.contains(r));
      if (hasMatch) {
        logger.w("Excluded pattern detected in url");
        return false;
      }
    }

    for (final app in _apps) {
      if (app.identifier != null &&
          (activity.identifier.isEmpty ||
              activity.identifier == app.identifier!)) {
        logger.w("Excluded pattern detected for the app.");
        return false;
      }
      if (activity.appFileName.startsWith(app.name)) {
        logger.w("Excluded pattern detected for the app name.");
        return false;
      }
      if (app.path != null && activity.appFilePath.endsWith(app.path!)) {
        logger.w("Excluded pattern detected for the app path.");
        return false;
      }
    }

    return true;
  }
}
