import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get app__name => 'CopyCat Clipboard';

  @override
  String get app__slogan => 'One Clipboard, Limitless Possibility';

  @override
  String get app__unknown_error => 'An unexpected error occurred';

  @override
  String get app__downloading => 'Downloading...';

  @override
  String get app__download => 'Download';

  @override
  String get app__follow_link => 'Follow Link';

  @override
  String get app__edit => 'Edit';

  @override
  String get app__export => 'Export';

  @override
  String get app__delete => 'Delete';

  @override
  String get app__later => 'Skip';

  @override
  String get login__local_signin__tooltip =>
      'No syncing. All data stays on your device.';

  @override
  String get login__local_signin__btn__label => 'Use Locally';

  @override
  String get login__form__input__name => 'Enter your good name';

  @override
  String get login__form__input__email => 'Enter your email';

  @override
  String get login__form__input__error_email =>
      'Please enter a valid email address';

  @override
  String get login__form__input__password => 'Enter your password';

  @override
  String get login__form__input__error_password_length =>
      'Please enter a password that is at least 6 characters long';

  @override
  String get login__form__button__signin => 'Sign In';

  @override
  String get login__form__button__signup => 'Sign Up';

  @override
  String get login__form__button__forgot_password => 'Forgot your password?';

  @override
  String get login__form__text__signup => 'Don\'t have an account? Sign up';

  @override
  String get login__form__text__old_user => 'Already have an account? Sign in';

  @override
  String get login__form__text__reset_password => 'Send password reset email';

  @override
  String get login__form__text__reset_ack =>
      'Password reset email has been sent';

  @override
  String get login__form__button__back => 'Back to sign in';

  @override
  String get login__form__button__update_password => 'Update Password';

  @override
  String get login__form__text_tnc_p1 =>
      'By continuing you agree to the following ';

  @override
  String get login__form__text_tnc_p2 => 'Privacy policies';

  @override
  String get login__form__text_tnc_p3 => ' and ';

  @override
  String get login__form__text_tnc_p4 => 'Terms of Service.';

  @override
  String get home__search__hint => 'Search in clipboard';

  @override
  String get home__search__reset => 'Reset Search';

  @override
  String get preview__vert_view__tab1_title => 'Preview';

  @override
  String get preview__vert_view__tab2__title => 'Details';

  @override
  String get preview__card__missing_text => 'This is an Empty Clip';

  @override
  String get preview__card__video__play => 'Play Video';

  @override
  String get preview__card__file__open => 'Open File';

  @override
  String get preview__form__title => 'Edit Details';

  @override
  String get preview__form__input__title => 'Title';

  @override
  String get preview__form__input__description => 'Description';

  @override
  String get reset_password__appbar__title => 'Reset your password';

  @override
  String get reset_password__success_ack => 'Password reset successfully';

  @override
  String get onboarding__button__to_login => 'Sign in';

  @override
  String get onboarding__snackbar__export_success =>
      'Encryption key successfully exported.';

  @override
  String get onboarding__dialog__skip_export__title =>
      '✋ Backup Your Encryption Key';

  @override
  String get onboarding__dialog__skip_export__subtitle =>
      'You haven’t exported your encryption key yet. Without a backup, you won’t be able to access your encrypted clips if the key is lost or you switch devices.\n\n👉 If you already have a secure backup of your key, you can safely continue. Otherwise, we strongly recommend exporting the key now to avoid data loss. Do you still want to continue?';

  @override
  String get onboarding__dialog__export_info__title =>
      '🤔 Why Export the Encryption Key?';

  @override
  String get onboarding__dialog__export_info__subtitle =>
      'Exporting your encryption key is essential for securely accessing your encrypted data on multiple devices. Without the key, your encrypted data will remain inaccessible after sync.\n\nKeep a backup of your encryption key in a secure location to prevent data loss. Remember, the key is unique to your account and cannot be recovered if lost.\n\nNote: Copycat cannot access your encrypted clips or your encryption keys. This is because we value your privacy above everything else.';

  @override
  String get onboarding__text__export_key_headline => 'Clipboard Encryption';

  @override
  String get onboarding__text__export_key_title =>
      '💪 Great News! Encryption is active for your clipboard';

  @override
  String get onboarding__button__export_key => 'Export Key';

  @override
  String get onboarding__dialog__skip_gen_key__title =>
      '✋ Your Clips Will Be Insecure';

  @override
  String get onboarding__dialog__skip_gen_key__subtitle =>
      'You haven’t generated an encryption key yet. Without it, your clips will remain unencrypted and insecure. You can generate the key later in Settings ❯ Security. Do you still want to continue?';

  @override
  String get onboarding__dialog__gen_key_info__title =>
      '🤔 Why Do I Need Encryption?';

  @override
  String get onboarding__dialog__gen_key_info__subtitle =>
      'Encryption protects your data by converting it into a secure format that can only be accessed with a key. Without encryption, your clips are stored in plain text, making them vulnerable to unauthorized access. Enabling encryption ensures that only you can access your sensitive data, providing an extra layer of security against potential breaches.';

  @override
  String get onboarding__text__gen_key_headline => 'Setup Clipboard Encryption';

  @override
  String onboarding__text__key_generated_title({required String keyPreview}) {
    return '🎉 Key $keyPreview*** successfully generated 🎉';
  }

  @override
  String get onboarding__button__regenerate_key => 'Re-Generate Key';

  @override
  String get onboarding__text__no_key =>
      'Your account doesn\'t have any encryption key';

  @override
  String get onboarding__button__generate_key => 'Generate Key';

  @override
  String get onboarding__button__do_it_later => 'Do it later';

  @override
  String get onboarding__button__why_important => 'Why It\'s Important?';

  @override
  String get onboarding__snackbar__invalid_key =>
      'This is not a valid CopyCat encryption key';

  @override
  String get onboarding__dialog__skip_import__title =>
      '✋ Encrypted Clips Inaccessible';

  @override
  String get onboarding__dialog__skip_import__subtitle =>
      'You haven’t imported the encryption key yet. This means all your encrypted clips will remain inaccessible locally after sync.\n\nTo access them, import the key from Settings ❯ Security.\nDo you still want to continue?';

  @override
  String get onboarding__dialog__reset_key__title =>
      '✋ Permanently Delete Encrypted Data';

  @override
  String get onboarding__dialog__reset_key__subtitle =>
      'This action is irreversible. Are you sure you want to permanently delete all encrypted data from the server?';

  @override
  String get onboarding__snackbar__reset_key__success =>
      'Encryption successfully removed.';

  @override
  String get onboarding__dialog__import_info__title => '🤔 Where is my key?';

  @override
  String get onboarding__dialog__import_info__subtitle =>
      'Your encryption key is a secure file generated during the encryption setup process. If you’ve misplaced it, check your downloads folder or any backup location where you might have saved it. Without this key, your encrypted data cannot be accessed.\n\nIf you’ve set up the encryption key on another device, you can export it by going to Settings ❯ Security ❯ E2EE Vault on that device. Transfer the key securely to this device to regain access to your encrypted data.';

  @override
  String get onboarding__text__import_key_headline =>
      'Import Clipboard Encryption Key';

  @override
  String get onboarding__text__import_key_title =>
      'Your account currently has active encryption.';

  @override
  String get onboarding__button__import_key => 'Import Key';

  @override
  String get onboarding__button__reset_key => 'Reset Encryption';

  @override
  String get onboarding__button__where_key => 'Where is the key?';

  @override
  String get drive__snackbar__success => 'Drive Setup is Now Complete.';

  @override
  String get drive__text__setting_up => 'Setting up and syncing...';

  @override
  String get drive__text__setting_up__warning =>
      'Please wait while we finish this up. Do not close the app.';

  @override
  String get create_clip__appbar__title__new => 'New Clip';

  @override
  String get create_clip__appbar__title__edit => 'Edit Clip';

  @override
  String get create_clip__button__save_new => 'Save as new';

  @override
  String get create_clip__input__hint => 'Write your clip content here';

  @override
  String get collections__text__tip =>
      'To ensure your important clips are always available regardless of time, across all your devices, save them in a collection!';

  @override
  String get collections__appbar__title => 'Collections';

  @override
  String get collections__appbar__title__create => 'Create Collection';

  @override
  String get collections__appbar__title__edit => 'Edit Collection';

  @override
  String get collections__input__name => 'Name';

  @override
  String get collections__input__description => 'Description';

  @override
  String get select_collection__appbar__title => 'Select Collection';

  @override
  String get account__dialog__delete_confirm__title => 'Account Delete Request';

  @override
  String get account__dialog__delete_confirm__description =>
      'You will be redirected to the account delete request form, are you sure?';

  @override
  String get account__list_tile__display_name => 'Display Name';

  @override
  String get account__list_tile__email => 'Email';

  @override
  String get account__list_tile__settings => 'Account Settings';

  @override
  String get account__list_tile__danger_zone => 'Danger Zone';

  @override
  String get account__button__req_delete => 'Request Account Deletion';

  @override
  String get account__appbar__title => 'My Account';

  @override
  String get settings__appbar__title => 'Settings';

  @override
  String get settings__tab__1 => 'General';

  @override
  String get settings__tab__2 => 'Customization';

  @override
  String get settings__tab__3 => 'Syncing';

  @override
  String get settings__tab__4 => 'Encryption';

  @override
  String get settings__tab__5 => 'Experimental';

  @override
  String get settings__text__encryption => 'Encryption';

  @override
  String get settings__text__sync_not_available =>
      'Sync-related configurations are not available while using the local clipboard.';

  @override
  String get settings__appbar__er__title => 'Exclusion Rules';

  @override
  String get settings__text__er__predefine => 'Predefined Exclusion Rules';

  @override
  String get settings__text__er__pass_manager => 'Password Managers';

  @override
  String get settings__text__er__cc => 'Credit Card Number';

  @override
  String get settings__text__er__phone => 'Phone number';

  @override
  String get settings__text__er__email => 'Email Address';

  @override
  String get settings__text__er__url => 'Sensitive Url';

  @override
  String get settings__text__decrypted__note =>
      '🥳 Congratulations! All your clips have been successfully decrypted locally,\n so rebuilding the database is not required.';

  @override
  String get settings__appbar__cer__title => 'Custom Exclusion Rules';

  @override
  String get custom_er__nav__1 => 'App';

  @override
  String get custom_er__nav__2 => 'Window Title';

  @override
  String get custom_er__nav__3 => 'Url';

  @override
  String get custom_er__nav__4 => 'Text Pattern';

  @override
  String get custom_er__text__not_supported =>
      'This exclusion is not supported yet';

  @override
  String get custom_er__tile__add_app => 'Add an app';

  @override
  String get custom_er__text__no_app => 'No custom app excluded yet';

  @override
  String get custom_er__button__remove_app => 'Remove this app';

  @override
  String get custom_er__tile__pattern =>
      'Prevent copy when copied content matches these patterns';

  @override
  String get custom_er__text__no_pattern => 'No custom pattern(s) excluded';

  @override
  String get custom_er__button__remove_pattern => 'Remove this pattern';

  @override
  String get custom_er__tile__url =>
      'Prevent copy from website matching these url segments.';

  @override
  String get custom_er__input__url_hint => 'Enter a url or part of a url here.';

  @override
  String get custom_er__text__no_url => 'No custom url(s) excluded';

  @override
  String get custom_er__button__remove_url => 'Remove this url';

  @override
  String get custom_er__tile__title =>
      'Prevent copy from app or website when window title matches.';

  @override
  String get custom_er__text__no_title => 'No custom title(s) excluded';

  @override
  String get custom_er__button__remove_title => 'Remove this title';
}
