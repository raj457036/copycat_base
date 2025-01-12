import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart' deferred as app_localizations_de;
import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_es.dart' deferred as app_localizations_es;
import 'app_localizations_fr.dart' deferred as app_localizations_fr;
import 'app_localizations_zh.dart' deferred as app_localizations_zh;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('en', 'US'),
    Locale('es'),
    Locale('fr'),
    Locale('zh')
  ];

  /// App name: CopyCat Clipboard
  ///
  /// In en_US, this message translates to:
  /// **'CopyCat Clipboard'**
  String get app__name;

  /// CopyCat Clipboard Slogan
  ///
  /// In en_US, this message translates to:
  /// **'One Clipboard, Limitless Possibility'**
  String get app__slogan;

  /// No description provided for @app__unknown_error.
  ///
  /// In en_US, this message translates to:
  /// **'An unexpected error occurred'**
  String get app__unknown_error;

  /// No description provided for @app__downloading.
  ///
  /// In en_US, this message translates to:
  /// **'Downloading...'**
  String get app__downloading;

  /// No description provided for @app__download.
  ///
  /// In en_US, this message translates to:
  /// **'Download'**
  String get app__download;

  /// No description provided for @app__follow_link.
  ///
  /// In en_US, this message translates to:
  /// **'Follow Link'**
  String get app__follow_link;

  /// No description provided for @app__edit.
  ///
  /// In en_US, this message translates to:
  /// **'Edit'**
  String get app__edit;

  /// No description provided for @app__export.
  ///
  /// In en_US, this message translates to:
  /// **'Export'**
  String get app__export;

  /// No description provided for @app__delete.
  ///
  /// In en_US, this message translates to:
  /// **'Delete'**
  String get app__delete;

  /// No description provided for @app__later.
  ///
  /// In en_US, this message translates to:
  /// **'Skip'**
  String get app__later;

  /// No description provided for @login__local_signin__tooltip.
  ///
  /// In en_US, this message translates to:
  /// **'No syncing. All data stays on your device.'**
  String get login__local_signin__tooltip;

  /// No description provided for @login__local_signin__btn__label.
  ///
  /// In en_US, this message translates to:
  /// **'Use Locally'**
  String get login__local_signin__btn__label;

  /// No description provided for @login__form__input__name.
  ///
  /// In en_US, this message translates to:
  /// **'Enter your good name'**
  String get login__form__input__name;

  /// No description provided for @login__form__input__email.
  ///
  /// In en_US, this message translates to:
  /// **'Enter your email'**
  String get login__form__input__email;

  /// No description provided for @login__form__input__error_email.
  ///
  /// In en_US, this message translates to:
  /// **'Please enter a valid email address'**
  String get login__form__input__error_email;

  /// No description provided for @login__form__input__password.
  ///
  /// In en_US, this message translates to:
  /// **'Enter your password'**
  String get login__form__input__password;

  /// No description provided for @login__form__input__error_password_length.
  ///
  /// In en_US, this message translates to:
  /// **'Please enter a password that is at least 6 characters long'**
  String get login__form__input__error_password_length;

  /// No description provided for @login__form__button__signin.
  ///
  /// In en_US, this message translates to:
  /// **'Sign In'**
  String get login__form__button__signin;

  /// No description provided for @login__form__button__signup.
  ///
  /// In en_US, this message translates to:
  /// **'Sign Up'**
  String get login__form__button__signup;

  /// No description provided for @login__form__button__forgot_password.
  ///
  /// In en_US, this message translates to:
  /// **'Forgot your password?'**
  String get login__form__button__forgot_password;

  /// No description provided for @login__form__text__signup.
  ///
  /// In en_US, this message translates to:
  /// **'Don\'t have an account? Sign up'**
  String get login__form__text__signup;

  /// No description provided for @login__form__text__old_user.
  ///
  /// In en_US, this message translates to:
  /// **'Already have an account? Sign in'**
  String get login__form__text__old_user;

  /// No description provided for @login__form__text__reset_password.
  ///
  /// In en_US, this message translates to:
  /// **'Send password reset email'**
  String get login__form__text__reset_password;

  /// No description provided for @login__form__text__reset_ack.
  ///
  /// In en_US, this message translates to:
  /// **'Password reset email has been sent'**
  String get login__form__text__reset_ack;

  /// No description provided for @login__form__button__back.
  ///
  /// In en_US, this message translates to:
  /// **'Back to sign in'**
  String get login__form__button__back;

  /// No description provided for @login__form__button__update_password.
  ///
  /// In en_US, this message translates to:
  /// **'Update Password'**
  String get login__form__button__update_password;

  /// No description provided for @login__form__text_tnc_p1.
  ///
  /// In en_US, this message translates to:
  /// **'By continuing you agree to the following '**
  String get login__form__text_tnc_p1;

  /// No description provided for @login__form__text_tnc_p2.
  ///
  /// In en_US, this message translates to:
  /// **'Privacy policies'**
  String get login__form__text_tnc_p2;

  /// No description provided for @login__form__text_tnc_p3.
  ///
  /// In en_US, this message translates to:
  /// **' and '**
  String get login__form__text_tnc_p3;

  /// No description provided for @login__form__text_tnc_p4.
  ///
  /// In en_US, this message translates to:
  /// **'Terms of Service.'**
  String get login__form__text_tnc_p4;

  /// No description provided for @home__search__hint.
  ///
  /// In en_US, this message translates to:
  /// **'Search in clipboard'**
  String get home__search__hint;

  /// No description provided for @home__search__reset.
  ///
  /// In en_US, this message translates to:
  /// **'Reset Search'**
  String get home__search__reset;

  /// No description provided for @preview__vert_view__tab1_title.
  ///
  /// In en_US, this message translates to:
  /// **'Preview'**
  String get preview__vert_view__tab1_title;

  /// No description provided for @preview__vert_view__tab2__title.
  ///
  /// In en_US, this message translates to:
  /// **'Details'**
  String get preview__vert_view__tab2__title;

  /// No description provided for @preview__card__missing_text.
  ///
  /// In en_US, this message translates to:
  /// **'This is an Empty Clip'**
  String get preview__card__missing_text;

  /// No description provided for @preview__card__video__play.
  ///
  /// In en_US, this message translates to:
  /// **'Play Video'**
  String get preview__card__video__play;

  /// No description provided for @preview__card__file__open.
  ///
  /// In en_US, this message translates to:
  /// **'Open File'**
  String get preview__card__file__open;

  /// No description provided for @preview__form__title.
  ///
  /// In en_US, this message translates to:
  /// **'Edit Details'**
  String get preview__form__title;

  /// No description provided for @preview__form__input__title.
  ///
  /// In en_US, this message translates to:
  /// **'Title'**
  String get preview__form__input__title;

  /// No description provided for @preview__form__input__description.
  ///
  /// In en_US, this message translates to:
  /// **'Description'**
  String get preview__form__input__description;

  /// No description provided for @reset_password__appbar__title.
  ///
  /// In en_US, this message translates to:
  /// **'Reset your password'**
  String get reset_password__appbar__title;

  /// No description provided for @reset_password__success_ack.
  ///
  /// In en_US, this message translates to:
  /// **'Password reset successfully'**
  String get reset_password__success_ack;

  /// No description provided for @onboarding__button__to_login.
  ///
  /// In en_US, this message translates to:
  /// **'Sign in'**
  String get onboarding__button__to_login;

  /// No description provided for @onboarding__snackbar__export_success.
  ///
  /// In en_US, this message translates to:
  /// **'Encryption key successfully exported.'**
  String get onboarding__snackbar__export_success;

  /// No description provided for @onboarding__dialog__skip_export__title.
  ///
  /// In en_US, this message translates to:
  /// **'✋ Backup Your Encryption Key'**
  String get onboarding__dialog__skip_export__title;

  /// No description provided for @onboarding__dialog__skip_export__subtitle.
  ///
  /// In en_US, this message translates to:
  /// **'You haven’t exported your encryption key yet. Without a backup, you won’t be able to access your encrypted clips if the key is lost or you switch devices.\n\n👉 If you already have a secure backup of your key, you can safely continue. Otherwise, we strongly recommend exporting the key now to avoid data loss. Do you still want to continue?'**
  String get onboarding__dialog__skip_export__subtitle;

  /// No description provided for @onboarding__dialog__export_info__title.
  ///
  /// In en_US, this message translates to:
  /// **'🤔 Why Export the Encryption Key?'**
  String get onboarding__dialog__export_info__title;

  /// No description provided for @onboarding__dialog__export_info__subtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Exporting your encryption key is essential for securely accessing your encrypted data on multiple devices. Without the key, your encrypted data will remain inaccessible after sync.\n\nKeep a backup of your encryption key in a secure location to prevent data loss. Remember, the key is unique to your account and cannot be recovered if lost.\n\nNote: Copycat cannot access your encrypted clips or your encryption keys. This is because we value your privacy above everything else.'**
  String get onboarding__dialog__export_info__subtitle;

  /// No description provided for @onboarding__text__export_key_headline.
  ///
  /// In en_US, this message translates to:
  /// **'Clipboard Encryption'**
  String get onboarding__text__export_key_headline;

  /// No description provided for @onboarding__text__export_key_title.
  ///
  /// In en_US, this message translates to:
  /// **'💪 Great News! Encryption is active for your clipboard'**
  String get onboarding__text__export_key_title;

  /// No description provided for @onboarding__button__export_key.
  ///
  /// In en_US, this message translates to:
  /// **'Export Key'**
  String get onboarding__button__export_key;

  /// No description provided for @onboarding__dialog__skip_gen_key__title.
  ///
  /// In en_US, this message translates to:
  /// **'✋ Your Clips Will Be Insecure'**
  String get onboarding__dialog__skip_gen_key__title;

  /// No description provided for @onboarding__dialog__skip_gen_key__subtitle.
  ///
  /// In en_US, this message translates to:
  /// **'You haven’t generated an encryption key yet. Without it, your clips will remain unencrypted and insecure. You can generate the key later in Settings ❯ Security. Do you still want to continue?'**
  String get onboarding__dialog__skip_gen_key__subtitle;

  /// No description provided for @onboarding__dialog__gen_key_info__title.
  ///
  /// In en_US, this message translates to:
  /// **'🤔 Why Do I Need Encryption?'**
  String get onboarding__dialog__gen_key_info__title;

  /// No description provided for @onboarding__dialog__gen_key_info__subtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Encryption protects your data by converting it into a secure format that can only be accessed with a key. Without encryption, your clips are stored in plain text, making them vulnerable to unauthorized access. Enabling encryption ensures that only you can access your sensitive data, providing an extra layer of security against potential breaches.'**
  String get onboarding__dialog__gen_key_info__subtitle;

  /// No description provided for @onboarding__text__gen_key_headline.
  ///
  /// In en_US, this message translates to:
  /// **'Setup Clipboard Encryption'**
  String get onboarding__text__gen_key_headline;

  /// No description provided for @onboarding__text__key_generated_title.
  ///
  /// In en_US, this message translates to:
  /// **'🎉 Key {keyPreview}*** successfully generated 🎉'**
  String onboarding__text__key_generated_title({required String keyPreview});

  /// No description provided for @onboarding__button__regenerate_key.
  ///
  /// In en_US, this message translates to:
  /// **'Re-Generate Key'**
  String get onboarding__button__regenerate_key;

  /// No description provided for @onboarding__text__no_key.
  ///
  /// In en_US, this message translates to:
  /// **'Your account doesn\'t have any encryption key'**
  String get onboarding__text__no_key;

  /// No description provided for @onboarding__button__generate_key.
  ///
  /// In en_US, this message translates to:
  /// **'Generate Key'**
  String get onboarding__button__generate_key;

  /// No description provided for @onboarding__button__do_it_later.
  ///
  /// In en_US, this message translates to:
  /// **'Do it later'**
  String get onboarding__button__do_it_later;

  /// No description provided for @onboarding__button__why_important.
  ///
  /// In en_US, this message translates to:
  /// **'Why It\'s Important?'**
  String get onboarding__button__why_important;

  /// No description provided for @onboarding__snackbar__invalid_key.
  ///
  /// In en_US, this message translates to:
  /// **'This is not a valid CopyCat encryption key'**
  String get onboarding__snackbar__invalid_key;

  /// No description provided for @onboarding__dialog__skip_import__title.
  ///
  /// In en_US, this message translates to:
  /// **'✋ Encrypted Clips Inaccessible'**
  String get onboarding__dialog__skip_import__title;

  /// No description provided for @onboarding__dialog__skip_import__subtitle.
  ///
  /// In en_US, this message translates to:
  /// **'You haven’t imported the encryption key yet. This means all your encrypted clips will remain inaccessible locally after sync.\n\nTo access them, import the key from Settings ❯ Security.\nDo you still want to continue?'**
  String get onboarding__dialog__skip_import__subtitle;

  /// No description provided for @onboarding__dialog__reset_key__title.
  ///
  /// In en_US, this message translates to:
  /// **'✋ Permanently Delete Encrypted Data'**
  String get onboarding__dialog__reset_key__title;

  /// No description provided for @onboarding__dialog__reset_key__subtitle.
  ///
  /// In en_US, this message translates to:
  /// **'This action is irreversible. Are you sure you want to permanently delete all encrypted data from the server?'**
  String get onboarding__dialog__reset_key__subtitle;

  /// No description provided for @onboarding__snackbar__reset_key__success.
  ///
  /// In en_US, this message translates to:
  /// **'Encryption successfully removed.'**
  String get onboarding__snackbar__reset_key__success;

  /// No description provided for @onboarding__dialog__import_info__title.
  ///
  /// In en_US, this message translates to:
  /// **'🤔 Where is my key?'**
  String get onboarding__dialog__import_info__title;

  /// No description provided for @onboarding__dialog__import_info__subtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Your encryption key is a secure file generated during the encryption setup process. If you’ve misplaced it, check your downloads folder or any backup location where you might have saved it. Without this key, your encrypted data cannot be accessed.\n\nIf you’ve set up the encryption key on another device, you can export it by going to Settings ❯ Security ❯ E2EE Vault on that device. Transfer the key securely to this device to regain access to your encrypted data.'**
  String get onboarding__dialog__import_info__subtitle;

  /// No description provided for @onboarding__text__import_key_headline.
  ///
  /// In en_US, this message translates to:
  /// **'Import Clipboard Encryption Key'**
  String get onboarding__text__import_key_headline;

  /// No description provided for @onboarding__text__import_key_title.
  ///
  /// In en_US, this message translates to:
  /// **'Your account currently has active encryption.'**
  String get onboarding__text__import_key_title;

  /// No description provided for @onboarding__button__import_key.
  ///
  /// In en_US, this message translates to:
  /// **'Import Key'**
  String get onboarding__button__import_key;

  /// No description provided for @onboarding__button__reset_key.
  ///
  /// In en_US, this message translates to:
  /// **'Reset Encryption'**
  String get onboarding__button__reset_key;

  /// No description provided for @onboarding__button__where_key.
  ///
  /// In en_US, this message translates to:
  /// **'Where is the key?'**
  String get onboarding__button__where_key;

  /// No description provided for @drive__snackbar__success.
  ///
  /// In en_US, this message translates to:
  /// **'Drive Setup is Now Complete.'**
  String get drive__snackbar__success;

  /// No description provided for @drive__text__setting_up.
  ///
  /// In en_US, this message translates to:
  /// **'Setting up and syncing...'**
  String get drive__text__setting_up;

  /// No description provided for @drive__text__setting_up__warning.
  ///
  /// In en_US, this message translates to:
  /// **'Please wait while we finish this up. Do not close the app.'**
  String get drive__text__setting_up__warning;

  /// No description provided for @create_clip__appbar__title__new.
  ///
  /// In en_US, this message translates to:
  /// **'New Clip'**
  String get create_clip__appbar__title__new;

  /// No description provided for @create_clip__appbar__title__edit.
  ///
  /// In en_US, this message translates to:
  /// **'Edit Clip'**
  String get create_clip__appbar__title__edit;

  /// No description provided for @create_clip__button__save_new.
  ///
  /// In en_US, this message translates to:
  /// **'Save as new'**
  String get create_clip__button__save_new;

  /// No description provided for @create_clip__input__hint.
  ///
  /// In en_US, this message translates to:
  /// **'Write your clip content here'**
  String get create_clip__input__hint;

  /// No description provided for @collections__text__tip.
  ///
  /// In en_US, this message translates to:
  /// **'To ensure your important clips are always available regardless of time, across all your devices, save them in a collection!'**
  String get collections__text__tip;

  /// No description provided for @collections__appbar__title.
  ///
  /// In en_US, this message translates to:
  /// **'Collections'**
  String get collections__appbar__title;

  /// No description provided for @collections__appbar__title__create.
  ///
  /// In en_US, this message translates to:
  /// **'Create Collection'**
  String get collections__appbar__title__create;

  /// No description provided for @collections__appbar__title__edit.
  ///
  /// In en_US, this message translates to:
  /// **'Edit Collection'**
  String get collections__appbar__title__edit;

  /// No description provided for @collections__input__name.
  ///
  /// In en_US, this message translates to:
  /// **'Name'**
  String get collections__input__name;

  /// No description provided for @collections__input__description.
  ///
  /// In en_US, this message translates to:
  /// **'Description'**
  String get collections__input__description;

  /// No description provided for @select_collection__appbar__title.
  ///
  /// In en_US, this message translates to:
  /// **'Select Collection'**
  String get select_collection__appbar__title;

  /// No description provided for @account__dialog__delete_confirm__title.
  ///
  /// In en_US, this message translates to:
  /// **'Account Delete Request'**
  String get account__dialog__delete_confirm__title;

  /// No description provided for @account__dialog__delete_confirm__description.
  ///
  /// In en_US, this message translates to:
  /// **'You will be redirected to the account delete request form, are you sure?'**
  String get account__dialog__delete_confirm__description;

  /// No description provided for @account__list_tile__display_name.
  ///
  /// In en_US, this message translates to:
  /// **'Display Name'**
  String get account__list_tile__display_name;

  /// No description provided for @account__list_tile__email.
  ///
  /// In en_US, this message translates to:
  /// **'Email'**
  String get account__list_tile__email;

  /// No description provided for @account__list_tile__settings.
  ///
  /// In en_US, this message translates to:
  /// **'Account Settings'**
  String get account__list_tile__settings;

  /// No description provided for @account__list_tile__danger_zone.
  ///
  /// In en_US, this message translates to:
  /// **'Danger Zone'**
  String get account__list_tile__danger_zone;

  /// No description provided for @account__button__req_delete.
  ///
  /// In en_US, this message translates to:
  /// **'Request Account Deletion'**
  String get account__button__req_delete;

  /// No description provided for @account__appbar__title.
  ///
  /// In en_US, this message translates to:
  /// **'My Account'**
  String get account__appbar__title;

  /// No description provided for @settings__appbar__title.
  ///
  /// In en_US, this message translates to:
  /// **'Settings'**
  String get settings__appbar__title;

  /// No description provided for @settings__tab__1.
  ///
  /// In en_US, this message translates to:
  /// **'General'**
  String get settings__tab__1;

  /// No description provided for @settings__tab__2.
  ///
  /// In en_US, this message translates to:
  /// **'Customization'**
  String get settings__tab__2;

  /// No description provided for @settings__tab__3.
  ///
  /// In en_US, this message translates to:
  /// **'Syncing'**
  String get settings__tab__3;

  /// No description provided for @settings__tab__4.
  ///
  /// In en_US, this message translates to:
  /// **'Encryption'**
  String get settings__tab__4;

  /// No description provided for @settings__tab__5.
  ///
  /// In en_US, this message translates to:
  /// **'Experimental'**
  String get settings__tab__5;

  /// No description provided for @settings__text__encryption.
  ///
  /// In en_US, this message translates to:
  /// **'Encryption'**
  String get settings__text__encryption;

  /// No description provided for @settings__text__sync_not_available.
  ///
  /// In en_US, this message translates to:
  /// **'Sync-related configurations are not available while using the local clipboard.'**
  String get settings__text__sync_not_available;

  /// No description provided for @settings__appbar__er__title.
  ///
  /// In en_US, this message translates to:
  /// **'Exclusion Rules'**
  String get settings__appbar__er__title;

  /// No description provided for @settings__text__er__predefine.
  ///
  /// In en_US, this message translates to:
  /// **'Predefined Exclusion Rules'**
  String get settings__text__er__predefine;

  /// No description provided for @settings__text__er__pass_manager.
  ///
  /// In en_US, this message translates to:
  /// **'Password Managers'**
  String get settings__text__er__pass_manager;

  /// No description provided for @settings__text__er__cc.
  ///
  /// In en_US, this message translates to:
  /// **'Credit Card Number'**
  String get settings__text__er__cc;

  /// No description provided for @settings__text__er__phone.
  ///
  /// In en_US, this message translates to:
  /// **'Phone number'**
  String get settings__text__er__phone;

  /// No description provided for @settings__text__er__email.
  ///
  /// In en_US, this message translates to:
  /// **'Email Address'**
  String get settings__text__er__email;

  /// No description provided for @settings__text__er__url.
  ///
  /// In en_US, this message translates to:
  /// **'Sensitive Url'**
  String get settings__text__er__url;

  /// No description provided for @settings__text__decrypted__note.
  ///
  /// In en_US, this message translates to:
  /// **'🥳 Congratulations! All your clips have been successfully decrypted locally,\n so rebuilding the database is not required.'**
  String get settings__text__decrypted__note;

  /// No description provided for @settings__appbar__cer__title.
  ///
  /// In en_US, this message translates to:
  /// **'Custom Exclusion Rules'**
  String get settings__appbar__cer__title;

  /// No description provided for @custom_er__nav__1.
  ///
  /// In en_US, this message translates to:
  /// **'App'**
  String get custom_er__nav__1;

  /// No description provided for @custom_er__nav__2.
  ///
  /// In en_US, this message translates to:
  /// **'Window Title'**
  String get custom_er__nav__2;

  /// No description provided for @custom_er__nav__3.
  ///
  /// In en_US, this message translates to:
  /// **'Url'**
  String get custom_er__nav__3;

  /// No description provided for @custom_er__nav__4.
  ///
  /// In en_US, this message translates to:
  /// **'Text Pattern'**
  String get custom_er__nav__4;

  /// No description provided for @custom_er__text__not_supported.
  ///
  /// In en_US, this message translates to:
  /// **'This exclusion is not supported yet'**
  String get custom_er__text__not_supported;

  /// No description provided for @custom_er__tile__add_app.
  ///
  /// In en_US, this message translates to:
  /// **'Add an app'**
  String get custom_er__tile__add_app;

  /// No description provided for @custom_er__text__no_app.
  ///
  /// In en_US, this message translates to:
  /// **'No custom app excluded yet'**
  String get custom_er__text__no_app;

  /// No description provided for @custom_er__button__remove_app.
  ///
  /// In en_US, this message translates to:
  /// **'Remove this app'**
  String get custom_er__button__remove_app;

  /// No description provided for @custom_er__tile__pattern.
  ///
  /// In en_US, this message translates to:
  /// **'Prevent copy when copied content matches these patterns'**
  String get custom_er__tile__pattern;

  /// No description provided for @custom_er__text__no_pattern.
  ///
  /// In en_US, this message translates to:
  /// **'No custom pattern(s) excluded'**
  String get custom_er__text__no_pattern;

  /// No description provided for @custom_er__button__remove_pattern.
  ///
  /// In en_US, this message translates to:
  /// **'Remove this pattern'**
  String get custom_er__button__remove_pattern;

  /// No description provided for @custom_er__tile__url.
  ///
  /// In en_US, this message translates to:
  /// **'Prevent copy from website matching these url segments.'**
  String get custom_er__tile__url;

  /// No description provided for @custom_er__input__url_hint.
  ///
  /// In en_US, this message translates to:
  /// **'Enter a url or part of a url here.'**
  String get custom_er__input__url_hint;

  /// No description provided for @custom_er__text__no_url.
  ///
  /// In en_US, this message translates to:
  /// **'No custom url(s) excluded'**
  String get custom_er__text__no_url;

  /// No description provided for @custom_er__button__remove_url.
  ///
  /// In en_US, this message translates to:
  /// **'Remove this url'**
  String get custom_er__button__remove_url;

  /// No description provided for @custom_er__tile__title.
  ///
  /// In en_US, this message translates to:
  /// **'Prevent copy from app or website when window title matches.'**
  String get custom_er__tile__title;

  /// No description provided for @custom_er__text__no_title.
  ///
  /// In en_US, this message translates to:
  /// **'No custom title(s) excluded'**
  String get custom_er__text__no_title;

  /// No description provided for @custom_er__button__remove_title.
  ///
  /// In en_US, this message translates to:
  /// **'Remove this title'**
  String get custom_er__button__remove_title;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return lookupAppLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'es', 'fr', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

Future<AppLocalizations> lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en':
      {
        switch (locale.countryCode) {
          case 'US':
            return app_localizations_en.loadLibrary().then(
                (dynamic _) => app_localizations_en.AppLocalizationsEnUs());
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return app_localizations_de
          .loadLibrary()
          .then((dynamic _) => app_localizations_de.AppLocalizationsDe());
    case 'en':
      return app_localizations_en
          .loadLibrary()
          .then((dynamic _) => app_localizations_en.AppLocalizationsEn());
    case 'es':
      return app_localizations_es
          .loadLibrary()
          .then((dynamic _) => app_localizations_es.AppLocalizationsEs());
    case 'fr':
      return app_localizations_fr
          .loadLibrary()
          .then((dynamic _) => app_localizations_fr.AppLocalizationsFr());
    case 'zh':
      return app_localizations_zh
          .loadLibrary()
          .then((dynamic _) => app_localizations_zh.AppLocalizationsZh());
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
