import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'CopyCat';

  @override
  String get en => 'Englisch';

  @override
  String get es => 'Spanisch';

  @override
  String get fr => 'Französisch';

  @override
  String get de => 'Deutsch';

  @override
  String get zh => 'Chinesisch';

  @override
  String get zh_cn => 'Vereinfachtes Chinesisch';

  @override
  String get language => 'Sprache';

  @override
  String get enterEmail => 'Geben Sie Ihre E-Mail-Adresse ein';

  @override
  String get validEmailError =>
      'Bitte geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String get enterPassword => 'Geben Sie Ihr Passwort ein';

  @override
  String get passwordLengthError =>
      'Bitte geben Sie ein Passwort mit mindestens 6 Zeichen ein';

  @override
  String get signIn => 'Anmelden';

  @override
  String get signUp => 'Registrieren';

  @override
  String get forgotPassword => 'Passwort vergessen?';

  @override
  String get dontHaveAccount => 'Haben Sie kein Konto? Registrieren';

  @override
  String get haveAccount => 'Haben Sie bereits ein Konto? Anmelden';

  @override
  String get sendPasswordReset => 'Passwort-Reset-E-Mail senden';

  @override
  String get backToSignIn => 'Zurück zur Anmeldung';

  @override
  String get updatePassword => 'Passwort aktualisieren';

  @override
  String get unexpectedError => 'Ein unerwarteter Fehler ist aufgetreten';

  @override
  String get passwordResetSent => 'Passwort-Reset-E-Mail wurde gesendet';

  @override
  String get collections => 'Sammlungen';

  @override
  String get collection => 'Sammlung';

  @override
  String get createCollection => 'Sammlung erstellen';

  @override
  String get editCollection => 'Sammlung bearbeiten';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get description => 'Beschreibung';

  @override
  String get noDescription => 'Keine Beschreibung';

  @override
  String get noResultsWereFound => 'Keine Ergebnisse gefunden';

  @override
  String get driveSetupDone => 'Laufwerk-Setup abgeschlossen 🥳';

  @override
  String get pleaseWaitWhileWeSetupSyncing =>
      'Bitte warten, während wir die Synchronisierung einrichten';

  @override
  String get driveSetupMayTakeFewMin =>
      'Dies kann etwa eine Minute dauern.\n(Bitte schließen Sie die App nicht)';

  @override
  String get refreshNow => 'Jetzt aktualisieren';

  @override
  String newUpdates(int added, int updated, int deleted) {
    return 'Änderungen verfügbar:\n $added hinzugefügt, $updated aktualisiert und $deleted gelöscht';
  }

  @override
  String get itemDeleted => 'Element gelöscht';

  @override
  String get deletingFromCloud => 'Aus der Cloud löschen';

  @override
  String get emptyClipboard => 'Ihr Zwischenspeicher ist leer';

  @override
  String get loadMore => 'Mehr laden';

  @override
  String get clipboard => 'Zwischenspeicher';

  @override
  String get search => 'Suche';

  @override
  String get share => 'Teilen';

  @override
  String get export => 'Exportieren';

  @override
  String get searchClipboard => 'Zwischenspeicher durchsuchen';

  @override
  String get settings => 'Einstellungen';

  @override
  String get copyCatClipboard => 'CopyCat Zwischenspeicher';

  @override
  String get oneClipboardLimitlessPosibility =>
      'Ein Zwischenspeicher, unbegrenzte Möglichkeiten';

  @override
  String get fullName => 'Vollständiger Name';

  @override
  String get preview => 'Vorschau';

  @override
  String get editDetails => 'Details bearbeiten';

  @override
  String get title => 'Titel';

  @override
  String get nothingHere => 'Nichts hier';

  @override
  String get downloading => 'Herunterladen';

  @override
  String get downloadForOffline => 'Für die Offline-Nutzung herunterladen';

  @override
  String get copyToClipboard => 'In den Zwischenspeicher kopieren';

  @override
  String get delete => 'Löschen';

  @override
  String get resetYourPassword => 'Setzen Sie Ihr Passwort zurück';

  @override
  String get passwordResetSuccess => 'Passwort erfolgreich zurückgesetzt';

  @override
  String get findWhateverYouLooking => 'Finden Sie, wonach Sie suchen...';

  @override
  String get noResults => 'Keine Ergebnisse gefunden.';

  @override
  String get searchInClipboard => 'Im Zwischenspeicher suchen';

  @override
  String get basicLocal => 'Basis • Lokal';

  @override
  String get localSettingsDesc =>
      'Diese Einstellungen gelten nur für dieses Gerät.';

  @override
  String get theme => 'Thema';

  @override
  String get syncLocal => 'Synchronisieren • Lokal';

  @override
  String get dontAutoCopyOver => 'Nicht automatisch kopieren';

  @override
  String dontAutoCopyOverDesc(String size) {
    return 'Dateien und Medien über einer bestimmten Größe ($size) werden nicht automatisch kopiert.';
  }

  @override
  String get dontAutoUploadOver => 'Nicht automatisch hochladen';

  @override
  String dontAutoUploadOverDesc(String size) {
    return 'Dateien und Medien über einer bestimmten Größe ($size) werden nicht automatisch hochgeladen.';
  }

  @override
  String get enableSync => 'Synchronisierung aktivieren';

  @override
  String get enableSyncDesc => 'Halte deine Clips über Geräte hinweg synchron';

  @override
  String get syncFiles => 'Dateien und Medien synchronisieren';

  @override
  String get syncFilesDesc =>
      'Halten Sie Ihre Dateien und Medien auf allen Geräten aktuell.';

  @override
  String get connected => 'Verbunden';

  @override
  String get loading => 'Laden...';

  @override
  String get authorizing => 'Autorisierung...';

  @override
  String get connectNow => 'Jetzt verbinden';

  @override
  String get tips => 'ⓘ Tipps';

  @override
  String get cloudStorageInfoDefault =>
      '\n\nGoogle Drive nicht verbunden, Datei- und Mediensynchronisierung ist deaktiviert.';

  @override
  String cloudStorageInfo(String info) {
    return '${info}Ihre Dateien und Medien werden sicher über Google Drive synchronisiert, um Ihre Privatsphäre zu schützen.';
  }

  @override
  String get attentionNeeded => '⚠ Aufmerksamkeit erforderlich!';

  @override
  String get isPaused => 'Ist pausiert?';

  @override
  String isPausedDesc(String isPaused, String till) {
    String _temp0 = intl.Intl.selectLogic(
      isPaused,
      {
        'true': 'Automatisches Kopieren ist nicht pausiert',
        'other': 'Automatisches Kopieren ist bis $till pausiert',
      },
    );
    return '$_temp0';
  }

  @override
  String get paste => 'Einfügen';

  @override
  String get copy => 'Kopieren';

  @override
  String get previewEdit => 'Vorschau & Bearbeiten';

  @override
  String get pastingTheSharedContent =>
      'Eingefügter Inhalt in den Zwischenspeicher';

  @override
  String get smartPaste => 'Intelligentes Einfügen';

  @override
  String get smartPasteDesc =>
      'Aktivieren Sie das direkte Einfügen von Clips in das zuletzt fokussierte Fenster.';

  @override
  String get launchAtStartup => 'Beim Start starten';

  @override
  String get launchAtStartupDesc =>
      'Aktivieren Sie die automatische Starten der App beim Start Ihres Geräts.';

  @override
  String get autoSyncInterval => 'Automatisches Synchronisierungsintervall';

  @override
  String get autoSyncIntervalDesc =>
      'El portapapeles se sincronizará automáticamente';

  @override
  String get clipboardShortcut => 'Zwischenspeicher-Kurzbefehle';

  @override
  String get clipboardShortcutDesc =>
      'Zwischenspeicher überall problemlos aufrufen';

  @override
  String clipboardShortcutPreview(String key) {
    return 'Aktuelle Kurzbefehlstaste: $key';
  }

  @override
  String get unassigned => 'Nicht zugewiesen';

  @override
  String get system => 'System';

  @override
  String get light => 'Hell';

  @override
  String get dark => 'Dunkel';

  @override
  String get local => 'Lokal';

  @override
  String get uploading => 'Hochladen...';

  @override
  String get pleaseWait => 'Bitte warten...';

  @override
  String get open => 'Öffnen';

  @override
  String get noCollection => 'Keine Sammlung';

  @override
  String get chooseCollection => 'Sammlung auswählen';

  @override
  String get changeCollection => 'Sammlung ändern';

  @override
  String get removeFromCollection => 'Aus der Sammlung entfernen';

  @override
  String get compactMode => 'Kompaktmodus';

  @override
  String createACollection(String left) {
    return 'Erstellen Sie eine neue Sammlung ( $left übrig )';
  }

  @override
  String get logout => 'Abmelden';

  @override
  String get logoutMessage =>
      '⚠️ WARNUNG ⚠️\n\nDas Abmelden löscht nicht synchronisierte Änderungen in der lokalen Datenbank. Möchten Sie wirklich fortfahren?';

  @override
  String get loggingYouOut => 'Sie werden abgemeldet! Bitte warten...';

  @override
  String get logoutSuccess => 'Erfolgreich abgemeldet';

  @override
  String get internetConnected => 'Internet verbunden';

  @override
  String get internetDisconnected => 'Internet getrennt';

  @override
  String get noCollectionFound => 'Keine Sammlung gefunden';

  @override
  String get done => 'Fertig';

  @override
  String get failed => 'Fehlgeschlagen';

  @override
  String get syncNow => 'Jetzt synchronisieren';

  @override
  String get syncNotAvailable => 'Synchronisierung nicht verfügbar';

  @override
  String get checkingForRecord => 'Überprüfen der Aufzeichnungen';

  @override
  String get sync => 'Synchronisieren';

  @override
  String get syncing => 'Synchronisieren';

  @override
  String syncingCheckFailed(String message) {
    return 'Synchronisierungsüberprüfung fehlgeschlagen: $message';
  }

  @override
  String get synced => '✅ Änderungen Synchronisiert';

  @override
  String get showWindow => 'Fenster anzeigen';

  @override
  String get hideWindow => 'Fenster ausblenden';

  @override
  String get hideWindowDesc =>
      'Tipp: Verwenden Sie die Tastenkombination, um den Zwischenspeicher anzuzeigen.';

  @override
  String get quit => 'Beenden';

  @override
  String get quitDesc => 'Sind Sie sicher, dass Sie beenden möchten?';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get openInBrowser => 'Im Browser öffnen';

  @override
  String get makePhoneCall => 'Einen Anruf tätigen';

  @override
  String get selectCollection => 'Sammlung auswählen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get recordKeyboardShortcut => 'Tastenkombination aufzeichnen.';

  @override
  String get recordKeyboardShortcutDesc =>
      'Geben Sie Ihre Tastenkombination über Ihre Tastatur ein und klicken Sie ';

  @override
  String get subscription => 'Abonnement';

  @override
  String get beta => 'PUBLIC BETA';

  @override
  String get featureListDetail =>
      'CopyCat Clipboard befindet sich derzeit in der Beta-Phase. Obwohl wir uns bemühen, eine nahtlose Erfahrung zu bieten, können gelegentlich Fehler auftreten. Bleiben Sie dran für zukünftige Funktionen und Verbesserungen.';

  @override
  String get currentPlan => 'Aktueller Plan';

  @override
  String currentPlanLabel(String label) {
    return 'Aktueller Plan • $label';
  }

  @override
  String get included => 'Inklusive';

  @override
  String get unlimitedClipboardItems => 'Unbegrenzte Zwischenablage-Elemente';

  @override
  String get unlimitedClipboardItemsDesc =>
      'Laufen Sie nie aus dem Speicherplatz mit unbegrenzten Zwischenablage-Elementen, um sicherzustellen, dass Sie immer Zugriff auf Ihre neuesten Kopien haben.';

  @override
  String get supportAllMajorPlatforms =>
      'Unterstützung aller wichtigen Plattformen';

  @override
  String get supportAllMajorPlatformsDesc =>
      'Nahtlose Synchronisierung auf allen wichtigen Plattformen—Android, iOS, Windows, macOS und Linux—für unterbrechungsfreie Produktivität überall.';

  @override
  String get supportsAppleUniversalClipboard =>
      'Unterstützt Apple Universal Clipboard';

  @override
  String get supportsAppleUniversalClipboardDesc =>
      'Übertragen Sie mühelos den Zwischenablage-Inhalt zwischen Ihren Apple-Geräten mit Unterstützung für Apples Universal Clipboard.';

  @override
  String get onDeviceStorage => 'Speicherung auf dem Gerät';

  @override
  String get onDeviceStorageDesc =>
      'Halten Sie Ihre Daten sicher mit Speicherung auf dem Gerät, um sicherzustellen, dass Ihre Zwischenablage-Elemente immer griffbereit und unter Ihrer Kontrolle sind.';

  @override
  String get googleDriveIntegration => 'Google Drive-Integration';

  @override
  String get googleDriveIntegrationDesc =>
      'Speichern Sie Dateien und Medien sicher auf Google Drive und integrieren Sie sich nahtlos mit CopyCat Clipboard für eine verbesserte Datenverwaltung.';

  @override
  String get instantSearch => 'Sofortsuche';

  @override
  String get instantSearchDesc =>
      'Finden Sie, was Sie brauchen, sofort mit leistungsstarken Sofortsuchfunktionen, die die Wiederherstellung von Zwischenablage-Elementen schnell und effizient machen.';

  @override
  String get syncingUpToLast24Hours =>
      'Synchronisierung der letzten 24 Stunden';

  @override
  String get syncingUpToLast24HoursDesc =>
      'Greife auf den Verlauf deines Clipboards zu und synchronisiere ihn auf all deinen Geräten für die letzten 24 Stunden. Dies stellt sicher, dass du keine wichtigen kopierten Elemente verlierst und macht deinen Arbeitsablauf nahtlos und effizient.';

  @override
  String get upTo3Collections => 'Bis zu 3 Sammlungen';

  @override
  String get upTo3CollectionsDesc =>
      'Organisieren Sie Ihre Zwischenablage-Elemente in bis zu 3 Sammlungen, um eine einfache Kategorisierung für ein besseres Workflow-Management zu ermöglichen.';

  @override
  String get autoSyncEvery45Seconds =>
      'Automatische Synchronisierung alle 45 Sekunden';

  @override
  String get autoSyncEvery45SecondsDesc =>
      'Genießen Sie die automatische Synchronisierung der Zwischenablage-Elemente alle 45 Sekunden, um Ihre Geräte ohne manuelles Eingreifen auf dem neuesten Stand zu halten.';

  @override
  String get withPro => 'Mit PRO ✨';

  @override
  String get withProDesc => 'Alles in Gratis enthalten +';

  @override
  String get supportE2EE => 'Unterstützung der Ende-zu-Ende-Verschlüsselung';

  @override
  String get supportE2EEDesc =>
      'E2EE wird alles verschlüsseln für überlegene Privatsphäre.';

  @override
  String get upto50Collection => 'Bis zu 50 Sammlungen';

  @override
  String get upto50CollectionDesc =>
      'Organisieren Sie Ihre Zwischenablage-Elemente in bis zu 50 Sammlungen für eine optimale Verwaltung.';

  @override
  String get syncLast720Hr => 'Synchronisierung der letzten 30 Tage';

  @override
  String get syncLast720HrDesc =>
      'Der Verlauf des Clipboards wird auf all deinen Geräten für Clips, die in den letzten 30 Tagen erstellt wurden, synchronisiert. Das bedeutet, dass du auf alle Clips zugreifen kannst, die du im letzten Monat kopiert hast, egal welches Gerät du verwendest.';

  @override
  String get realtimeSync => 'Echtzeit-Synchronisation';

  @override
  String get realtimeSyncDesc => 'Erleben Sie blitzschnelle Synchronisierung.';

  @override
  String get prioritySupport => 'Schneller und priorisierter Support';

  @override
  String get prioritySupportDesc =>
      'Erhalten Sie schnellen und priorisierten Support als PRO-Benutzer.';

  @override
  String get earlyAccessToNewFeature => 'Früher Zugriff auf neue Funktionen';

  @override
  String get earlyAccessToNewFeatureDesc =>
      'Seien Sie der Erste, der neue Funktionen und Updates ausprobiert.';

  @override
  String get termsAgreeP1 => 'Durch die Fortsetzung stimmen Sie den folgenden ';

  @override
  String get privacyPolicies => 'Datenschutzrichtlinien';

  @override
  String get and => ' und ';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get termsAgreeP2 => ' zu.';

  @override
  String get backToApp => 'Zurück zur App';

  @override
  String get experimental => '🧪';

  @override
  String get experimentalDescription =>
      'Diese Funktion ist experimentell und könnte nicht wie erwartet funktionieren.';

  @override
  String get selectAnOption => 'Wählen Sie eine Option';

  @override
  String get advanceSecurity => 'Erweiterte Sicherheit';

  @override
  String get endToEndVault => 'Ende-zu-Ende-Verschlüsselung Tresor';

  @override
  String get accessE2eeVault =>
      'Greifen Sie auf Ihre E2EE-Tresoreinstellungen zu';

  @override
  String get encryptClipboard => 'Zwischenablage verschlüsseln';

  @override
  String get encryptClipboardDesc =>
      'Verschlüsseln Sie die Zwischenablage, bevor Sie sie mit der Cloud synchronisieren.';

  @override
  String get $5Sec => 'Sofort';

  @override
  String get $10Sec => 'Schnell';

  @override
  String get $20Sec => 'Zügig';

  @override
  String get $45Sec => 'Ausgewogen';

  @override
  String get $60Sec => 'Locker';

  @override
  String get $5MB => '5 MB';

  @override
  String get $10MB => '10 MB';

  @override
  String get $20MB => '20 MB';

  @override
  String get $50MB => '50 MB';

  @override
  String get $100MB => '100 MB';

  @override
  String get e2eeNotSetup => 'E2EE noch nicht eingerichtet.';

  @override
  String get settingE2eeVault => 'Einrichten des E2EE-Tresors';

  @override
  String get e2eeSetupWarning =>
      'Wenn Sie Ihren E2EE-Schlüssel verlieren und keine Sicherung haben, sind Ihre verschlüsselten Daten dauerhaft unzugänglich. Bewahren Sie Ihren Schlüssel sicher und gesichert auf.';

  @override
  String get e2eeSetupDesc =>
      'Erstellen Sie Ihren E2EE-Tresorschlüssel und speichern Sie ihn an einem sicheren Ort. Sie benötigen diesen Schlüssel, um andere Geräte einzurichten, um auf Ihre verschlüsselten Informationen zuzugreifen.';

  @override
  String get generating => 'Erstellen...';

  @override
  String get generateKey => 'E2EE-Tresorschlüssel erstellen';

  @override
  String get importE2eeKey => 'E2EE-Tresorschlüssel importieren';

  @override
  String get importE2eeInvalidKey =>
      '⚠️ Der importierte Schlüssel ist ungültig!';

  @override
  String get importE2eeDesc =>
      'Importieren Sie unten Ihren E2EE-Tresorschlüssel, um den Zugriff auf Ihre verschlüsselten Informationen auf diesem Gerät zu ermöglichen. Stellen Sie sicher, dass der Schlüssel sicher gespeichert ist und nicht weitergegeben wird.';

  @override
  String get importing => 'Importieren...';

  @override
  String get importKey => 'E2EE-Tresorschlüssel importieren';

  @override
  String get e2eeVault => 'E2EE-Tresor';

  @override
  String get e2eeExportNote =>
      'Herzlichen Glückwunsch, Sie haben die Ende-zu-Ende-Verschlüsselung erfolgreich eingerichtet.';

  @override
  String get e2eeExportDesc =>
      'Klicken Sie unten auf die Schaltfläche, um Ihren E2EE-Tresorschlüssel zu exportieren.\nSpeichern Sie den Schlüssel an einem sicheren Ort, um sicherzustellen, dass Sie andere Geräte einrichten können, um auf Ihre verschlüsselten Informationen zuzugreifen.';

  @override
  String get exportKey => 'E2EE-Tresorschlüssel exportieren';

  @override
  String get exportSuccess => '✅ Erfolgreich exportiert';

  @override
  String get copySuccess => '✅ Erfolgreich in die Zwischenablage kopiert';

  @override
  String get whatsNew => 'Was gibt\'s Neues?';

  @override
  String get feature1 => 'Andock- und Fenstermodus';

  @override
  String get feature1Desc =>
      'Du kannst dein Clipboard jetzt an jedem Rand andocken oder wie gewohnt schweben lassen.';

  @override
  String get feature2 => 'Listen- und Rasteransicht für deine Clips';

  @override
  String get feature2Desc =>
      'In unterstützten Fenstergrößen kannst du jetzt zwischen Listen- und Rasteransicht für deine Clips wählen.';

  @override
  String get feature3 => 'Ausschlussregeln';

  @override
  String get feature3Desc =>
      'Präzise Kontrolle darüber, was nicht in die Zwischenablage kopiert werden soll.';

  @override
  String get feature4 => 'Massenoperationen';

  @override
  String get feature4Desc =>
      'Wähle jetzt mehrere Clips aus und führe Massenoperationen durch.';

  @override
  String get gettingStarted => 'Erste Schritte';

  @override
  String get howToUse => 'Anleitung';

  @override
  String get howToUseDesc =>
      'Wie verwendet man CopyCat? Lesen Sie unsere Dokumentation, um loszulegen.';

  @override
  String get tutorials => 'Video-Tutorials';

  @override
  String get tutorialsDesc =>
      'Erfahren Sie, wie Sie das Beste aus CopyCat herausholen, mit unseren Schritt-für-Schritt-Video-Tutorials.';

  @override
  String get learnAboutFeatures =>
      'Erfahren Sie mehr über alle Funktionen, die CopyCat zu bieten hat.';

  @override
  String get learn => 'Lernen';

  @override
  String get upgrade => 'Upgrade';

  @override
  String trialTill(String till) {
    return 'Testversion bis $till';
  }

  @override
  String expiredPlan(String planName) {
    return '$planName • Abgelaufen';
  }

  @override
  String get displayName => 'Anzeigename';

  @override
  String get email => 'E-Mail';

  @override
  String get accountSettings => 'Kontoeinstellungen';

  @override
  String get dangerZone => 'Gefahrenzone';

  @override
  String get requestAccountDeletion => 'Antrag auf Kontolöschung';

  @override
  String get myAccount => 'Mein Konto';

  @override
  String get accountDeleteDialogTitle => 'Antrag auf Kontolöschung';

  @override
  String get accountDeleteDialogDesc =>
      'Sie werden zum Formular für den Antrag auf Kontolöschung weitergeleitet, sind Sie sicher?';

  @override
  String get unlockPremiumFeatures => 'Schalte CopyCat PRO frei';

  @override
  String get upgradeToPro =>
      'Genießen Sie über 720 Stunden synchronisierten Verlauf, mehr als 50 Sammlungen, Ende-zu-Ende-Verschlüsselung, Echtzeitsynchronisierung, Zugang zu den neuesten Funktionen und vieles mehr.';

  @override
  String get tryAgain => 'Bitte versuche es erneut';

  @override
  String get continue_ => 'Fortsetzen';

  @override
  String get year => 'Jahr';

  @override
  String get month => 'Monat';

  @override
  String get manageSubscriptions => 'Abonnements Verwalten';

  @override
  String promoSub(String till) {
    return 'Sie nutzen ein Promo-Abonnement bis $till';
  }

  @override
  String get subscriptionUpdated => 'Abonnement Aktualisiert';

  @override
  String get grantedEntitlement => 'Zugewiesenes Recht';

  @override
  String get grantedEntitlementDesc =>
      'Zugewiesene Berechtigungscodes werden mit bestimmten Personen für benutzerdefinierte Berechtigungen geteilt. Sie können überprüfen, ob Einladungen noch verfügbar sind, indem Sie ';

  @override
  String get clickingHere => 'hier klicken.';

  @override
  String get enterCodeSubmit =>
      'Geben Sie den Code ein und drücken Sie Absenden';

  @override
  String get submit => 'Absenden';

  @override
  String get subscribeInSupportedPlatform =>
      'Um auf Premium-Funktionen von Copycat Clipboard zuzugreifen, abonnieren Sie bitte über den Play Store oder den Apple App Store. Ihr Abonnement wird auf all Ihren Geräten, einschließlich Linux und Windows, synchronisiert.';

  @override
  String get timeSyncWarning => '⚠️ Zeit-Synchronisierungswarnung';

  @override
  String get timeSyncWarningNote1 => 'Inkonsistente Gerätezeit erkannt';

  @override
  String get timeSyncWarningNote2 =>
      'Um eine genaue Synchronisierung des Clipboards zu gewährleisten, überprüfen und korrigieren Sie bitte die Zeiteinstellungen Ihres Geräts.';

  @override
  String get timeSyncWarningNote3 =>
      'Inkonsistente Zeiteinstellungen können Synchronisierungsprobleme verursachen.';

  @override
  String get checkAgain => 'Erneut überprüfen';

  @override
  String get shareYourFeedback => 'Teilen Sie Ihr Feedback';

  @override
  String get shareYourFeedbackDesc =>
      'Wir schätzen Ihre Meinung! Ob es ein Vorschlag, ein Fehlerbericht oder nur ein Hallo ist, Ihr Beitrag ist für uns von unschätzbarem Wert.';

  @override
  String get joinDiscord => 'Treten Sie Unserer Discord-Community Bei';

  @override
  String get joinDiscordDesc =>
      'Vernetzen Sie sich mit anderen Nutzern, teilen Sie Ideen, erhalten Sie Updates und chatten Sie direkt mit uns.';

  @override
  String get joinGoogleGroup => 'Treten Sie Unserer Google-Gruppe Bei';

  @override
  String get joinGoogleGroupDesc =>
      'Bleiben Sie informiert und arbeiten Sie mit anderen Nutzern in unserer Google-Gruppe zusammen.';

  @override
  String get rebuildingDB => '⏱️ Datenbank wird neu aufgebaut\nBitte warten...';

  @override
  String get proTip => 'Profi-Tipp';

  @override
  String get useCollectionProTip =>
      'Um sicherzustellen, dass deine wichtigen Clips unabhängig von der Zeit auf all deinen Geräten immer verfügbar sind, speichere sie in einer Sammlung!';

  @override
  String get syncConfigNotAvailable =>
      'Synchronisierungsbezogene Konfigurationen sind nicht verfügbar, wenn das lokale Clipboard verwendet wird.';

  @override
  String get useLocally => 'Lokal verwenden';

  @override
  String get useLocallyDesc =>
      'Keine Synchronisierung. Alle Daten bleiben auf deinem Gerät.';

  @override
  String maxDroppableItem(int count) {
    return 'Maximal $count Elemente auf einmal erlaubt.';
  }

  @override
  String get dropHere => 'Lass deine Dateien, Bilder oder Texte hier fallen';

  @override
  String get general => 'Allgemein';

  @override
  String get customization => 'Anpassung';

  @override
  String get syncingLabel => 'Synchronisieren';

  @override
  String get encryption => 'Verschlüsselung';

  @override
  String get searchFilters => 'Suchfilter';

  @override
  String get from => 'Von';

  @override
  String get to => 'Bis';

  @override
  String get now => 'Jetzt';

  @override
  String get including => 'Einschließlich';

  @override
  String get text => 'Text';

  @override
  String get url => 'URL';

  @override
  String get media => 'Medien';

  @override
  String get docs => 'Dokumente';

  @override
  String get textCategories => 'Textkategorien';

  @override
  String get exclusive => '( Exklusiv )';

  @override
  String get phone => 'Telefon';

  @override
  String get color => 'Farbe';

  @override
  String get sortBy => 'Sortieren Nach';

  @override
  String get select => 'Auswählen';

  @override
  String get lastModified => 'Zuletzt Geändert';

  @override
  String get created => 'Erstellt';

  @override
  String get copyCount => 'Anzahl der Kopien';

  @override
  String get lastCopied => 'Zuletzt Kopiert';

  @override
  String get sortOrder => 'Sortierreihenfolge';

  @override
  String get asc => 'Auf';

  @override
  String get desc => 'Ab';

  @override
  String get applyFilter => 'Filter Anwenden';

  @override
  String get themeColor => 'Themenfarbe';

  @override
  String get themeColorDesc =>
      'Diese Farbe beeinflusst das allgemeine Erscheinungsbild der App.';

  @override
  String get change => 'Ändern';

  @override
  String get colorMode => 'Farbmodus';

  @override
  String get colorModeDesc =>
      'Wählen Sie den Farbmodus, um das Erscheinungsbild der App anzupassen. Die Standardoption ist Tonal Spot.';

  @override
  String get tonalSpot => 'Tonal Spot';

  @override
  String get content => 'Inhalt';

  @override
  String get expressive => 'Ausdrucksvoll';

  @override
  String get fidility => 'Fidelity';

  @override
  String get fruitSalad => 'Fruchtsalat';

  @override
  String get monochrome => 'Monochrom';

  @override
  String get neutral => 'Neutral';

  @override
  String get rainbow => 'Regenbogen';

  @override
  String get vibrant => 'Lebendig';

  @override
  String get customExclusionRuleFeature => 'Custom Exclusion Rules';

  @override
  String get customExclusionRuleFeatureDesc =>
      'Precise control over your clipboard. Allows you to define what to copy, from where to copy and when to copy.';

  @override
  String get dragNDropFeature => 'Ziehen & Ablegen';

  @override
  String get dragNDropFeatureDesc =>
      'Bewege Elemente nahtlos in jede Richtung auf deinen Desktop- und Tablet-Geräten.';

  @override
  String get experimentalLabel => 'Experimentell';

  @override
  String get dragNdrop => 'Ziehen & Ablegen';

  @override
  String get dragNdropDesc =>
      'Erlaube es, Elemente innerhalb der App in beide Richtungen frei zu bewegen.';

  @override
  String get featureNotSupported =>
      'Entschuldigung, diese Funktion ist auf deiner Plattform derzeit nicht verfügbar.';

  @override
  String get themingFeature => 'Themen';

  @override
  String get themingFeatureDesc =>
      'Passen Sie das gesamte Aussehen und Gefühl der App an Ihre Vorlieben an.';

  @override
  String get resetSearch => 'Suche Zurücksetzen';

  @override
  String get security => 'Sicherheit';

  @override
  String get exclusionRules => 'Ausschlussregeln';

  @override
  String get exclusionRulesDesc =>
      'Verhindern Sie, dass Informationen in die Zwischenablage kopiert werden. Klicken Sie für erweiterte Kontrolle.';

  @override
  String get predefinedExclRules => 'Vordefinierte Ausschlussregeln';

  @override
  String get passwordManagers => 'Passwort-Manager';

  @override
  String get commonPasswordPatterns => 'Allgemeine Passwortmuster';

  @override
  String get creditCardNumber => 'Kreditkartennummer';

  @override
  String get phoneNumber => 'Telefonnummer';

  @override
  String get bankAccountNumber => 'Kontonummer';

  @override
  String get passportNumber => 'Reisepassnummer';

  @override
  String get sensitiveUrls => 'Empfindliche URLs';

  @override
  String get customExclusionRules => 'Benutzerdefinierte Ausschlussregeln';

  @override
  String get customRules => 'Benutzerdefinierte Regeln';

  @override
  String get customRulesDesc =>
      'Ausschließen nach App, App-Fenster/Website-Titel, Website-URL oder Regex-Muster.';

  @override
  String get apps => 'Apps';

  @override
  String get pattern => 'Muster';

  @override
  String get excludeAnApp => 'Eine neue App hinzufügen';

  @override
  String get noCustomAppExcluded =>
      'Keine benutzerdefinierte App ausgeschlossen';

  @override
  String get removeCustomApp => 'Diese App entfernen';

  @override
  String get excludeUrl =>
      'Kopieren von Webseiten verhindern, die mit diesen URL-Segmenten übereinstimmen.';

  @override
  String get excludeUrlInputHint =>
      'Geben Sie hier eine URL oder einen Teil einer URL ein.';

  @override
  String get noCustomUrlExcluded =>
      'Keine benutzerdefinierte URL ausgeschlossen';

  @override
  String get removeCustomUrl => 'Diese URL entfernen';

  @override
  String get excludePattern =>
      'Verhindern Sie das Kopieren, wenn der kopierte Inhalt mit diesen Mustern übereinstimmt.';

  @override
  String get noCustomPatternExcluded =>
      'Kein benutzerdefiniertes Muster ausgeschlossen';

  @override
  String get removeCustomPattern => 'Dieses Muster entfernen';

  @override
  String get excludeTitle =>
      'Verhindern Sie das Kopieren von Apps oder Webseiten, wenn der Fenstertitel übereinstimmt.';

  @override
  String get noCustomTitleExcluded =>
      'Kein benutzerdefinierter Titel ausgeschlossen';

  @override
  String get removeCustomTitle => 'Diesen Titel entfernen';

  @override
  String get reconnectGoogleDrive => '⚠️ Google Drive neu verbinden?';

  @override
  String get reconnectGoogleDriveDesc =>
      'Ihr Laufwerk ist bereits verbunden! Möchten Sie es neu verbinden?\n\nUm Datenverlust zu vermeiden, verwenden Sie bitte dasselbe Konto wie zuvor.';

  @override
  String get sureToDeleteItem => 'Sind Sie sicher, dieses Element zu löschen?';

  @override
  String get noAppFoundToHandleFile =>
      'Keine Anwendung gefunden, um diese Datei zu öffnen.';

  @override
  String get fileOpenPermissionNotGranted =>
      'Berechtigung zum Öffnen dieser Datei nicht erteilt.';

  @override
  String get proOnlyTooltip =>
      'Diese Funktion ist nur für Pro-Nutzer verfügbar.';

  @override
  String get viewWindow => 'Fenster';

  @override
  String get viewDockRight => 'Rechts andocken';

  @override
  String get viewDockLeft => 'Links andocken';

  @override
  String get viewDockTop => 'Oben andocken';

  @override
  String get viewDockBottom => 'Unten andocken';

  @override
  String get changeView => 'Ansicht ändern';

  @override
  String get pin => 'Anheften';

  @override
  String get unpin => 'Loslösen';

  @override
  String get layoutToGrid => 'Zum Rasterlayout wechseln';

  @override
  String get layoutToList => 'Zum Listenlayout wechseln';
}
