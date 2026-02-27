///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsDe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppDe app = _TranslationsAppDe._(_root);
	@override late final _TranslationsCommonDe common = _TranslationsCommonDe._(_root);
	@override late final _TranslationsProjectSelectorDe projectSelector = _TranslationsProjectSelectorDe._(_root);
	@override late final _TranslationsProjectInfoDe projectInfo = _TranslationsProjectInfoDe._(_root);
	@override late final _TranslationsConfigDe config = _TranslationsConfigDe._(_root);
	@override late final _TranslationsExportDialogDe exportDialog = _TranslationsExportDialogDe._(_root);
	@override late final _TranslationsProfileDe profile = _TranslationsProfileDe._(_root);
	@override late final _TranslationsBuildDe build = _TranslationsBuildDe._(_root);
	@override late final _TranslationsBuildLogDe buildLog = _TranslationsBuildLogDe._(_root);
	@override late final _TranslationsBuildStatusDe buildStatus = _TranslationsBuildStatusDe._(_root);
	@override late final _TranslationsPlatformsDe platforms = _TranslationsPlatformsDe._(_root);
	@override late final _TranslationsPlatformConfigDe platformConfig = _TranslationsPlatformConfigDe._(_root);
	@override late final _TranslationsAndroidOutputDe androidOutput = _TranslationsAndroidOutputDe._(_root);
	@override late final _TranslationsIosOutputDe iosOutput = _TranslationsIosOutputDe._(_root);
	@override late final _TranslationsBuildModeDe buildMode = _TranslationsBuildModeDe._(_root);
	@override late final _TranslationsPwaStrategyDe pwaStrategy = _TranslationsPwaStrategyDe._(_root);
	@override late final _TranslationsLanguageDe language = _TranslationsLanguageDe._(_root);
	@override late final _TranslationsThemeDe theme = _TranslationsThemeDe._(_root);
	@override late final _TranslationsPublishDe publish = _TranslationsPublishDe._(_root);
}

// Path: app
class _TranslationsAppDe extends TranslationsAppEn {
	_TranslationsAppDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get name => 'BuildPaw';
}

// Path: common
class _TranslationsCommonDe extends TranslationsCommonEn {
	_TranslationsCommonDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Abbrechen';
	@override String get export => 'Exportieren';
	@override String get browse => 'Durchsuchen';
	@override String get save => 'Speichern';
	@override String get delete => 'Löschen';
}

// Path: projectSelector
class _TranslationsProjectSelectorDe extends TranslationsProjectSelectorEn {
	_TranslationsProjectSelectorDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'BuildPaw';
	@override String get hint => 'Flutter-Projektverzeichnis auswählen...';
	@override String get selectDialogTitle => 'Flutter-Projekt auswählen';
}

// Path: projectInfo
class _TranslationsProjectInfoDe extends TranslationsProjectInfoEn {
	_TranslationsProjectInfoDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Projektinfo';
	@override String get generalTab => 'Allgemein';
	@override String get dependenciesTab => 'Abhängigkeiten';
	@override String get refreshTooltip => 'Projektinfo aktualisieren';
	@override String get fvmActive => 'FVM Aktiv';
	@override String get fvmInactive => 'Kein FVM';
	@override String get noDependencies => 'Keine Abhängigkeiten gefunden';
	@override String get package => 'Paket';
	@override String get version => 'Version';
}

// Path: config
class _TranslationsConfigDe extends TranslationsConfigEn {
	_TranslationsConfigDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get export => 'Konfiguration exportieren';
	@override String get import => 'Konfiguration importieren';
	@override String exportSuccess({required Object path}) => 'Konfiguration exportiert nach ${path}';
	@override String get exportCancelled => 'Export abgebrochen.';
	@override String importSuccess({required Object name}) => 'Importiert: ${name}';
	@override String get importCancelled => 'Import abgebrochen oder Datei ungültig.';
	@override String get dropToImport => 'JSON-Datei zum Importieren ablegen';
}

// Path: exportDialog
class _TranslationsExportDialogDe extends TranslationsExportDialogEn {
	_TranslationsExportDialogDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Build-Konfiguration exportieren';
	@override String get presetName => 'Voreinstellungsname';
	@override String get presetNameHint => 'z.B. release-prod';
	@override String get version => 'Version';
	@override String get versionHint => 'z.B. 1.0.0';
}

// Path: profile
class _TranslationsProfileDe extends TranslationsProfileEn {
	_TranslationsProfileDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profile';
	@override String get noProfiles => 'Keine gespeicherten Profile';
	@override String get saveProfile => 'Profil speichern';
	@override String get newProfile => 'Neues Profil';
	@override String get profileName => 'Profilname';
	@override String get profileNameHint => 'z.B. release-prod';
	@override String get version => 'Version';
	@override String get versionHint => 'z.B. 1.0.0';
	@override String saveSuccess({required Object name}) => 'Profil \'${name}\' gespeichert';
	@override String deleteConfirm({required Object name}) => 'Profil \'${name}\' löschen?';
	@override String get deleteSuccess => 'Profil gelöscht';
	@override String applied({required Object name}) => 'Profil \'${name}\' angewendet';
	@override String get updateExisting => 'Vorhandenes aktualisieren';
	@override String get saveAsNew => 'Als neu speichern';
	@override String overwriteConfirm({required Object name}) => 'Profil \'${name}\' existiert bereits. Überschreiben?';
}

// Path: build
class _TranslationsBuildDe extends TranslationsBuildEn {
	_TranslationsBuildDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get button => 'BAUEN';
	@override String get building => 'Wird gebaut...';
	@override String buildingPlatform({required Object platform, required Object completed, required Object total}) => '${platform} wird gebaut... (${completed}/${total})';
	@override String get cancel => 'Abbrechen';
}

// Path: buildLog
class _TranslationsBuildLogDe extends TranslationsBuildLogEn {
	_TranslationsBuildLogDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Build-Ausgabe';
	@override String get copyTooltip => 'Logs kopieren';
	@override String get copied => 'Logs in Zwischenablage kopiert';
	@override String get placeholder => 'Build-Ausgabe erscheint hier...';
}

// Path: buildStatus
class _TranslationsBuildStatusDe extends TranslationsBuildStatusEn {
	_TranslationsBuildStatusDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get idle => 'Inaktiv';
	@override String get running => 'Läuft';
	@override String get success => 'Erfolg';
	@override String get failed => 'Fehlgeschlagen';
}

// Path: platforms
class _TranslationsPlatformsDe extends TranslationsPlatformsEn {
	_TranslationsPlatformsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get android => 'Android';
	@override String get ios => 'iOS';
	@override String get web => 'Web';
}

// Path: platformConfig
class _TranslationsPlatformConfigDe extends TranslationsPlatformConfigEn {
	_TranslationsPlatformConfigDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get outputType => 'Ausgabetyp';
	@override String get codeObfuscation => 'Code-Verschleierung';
	@override String get splitDebugInfo => 'Split Debug Info';
	@override String get flavor => 'Flavor';
	@override String get flavorHint => 'z.B. dev, staging, prod';
	@override String get runMode => 'Ausführungsmodus';
	@override String get target => 'Ziel';
	@override String get targetHint => 'lib/main.dart';
	@override String get pwaStrategy => 'PWA-Strategie';
	@override String get noTreeShakeIcons => 'No Tree Shake Icons';
}

// Path: androidOutput
class _TranslationsAndroidOutputDe extends TranslationsAndroidOutputEn {
	_TranslationsAndroidOutputDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get apk => 'Nur APK';
	@override String get aab => 'Nur AAB';
	@override String get both => 'APK & AAB';
}

// Path: iosOutput
class _TranslationsIosOutputDe extends TranslationsIosOutputEn {
	_TranslationsIosOutputDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get ios => 'iOS (Runner.app)';
	@override String get ipa => 'IPA (Exportierbar)';
}

// Path: buildMode
class _TranslationsBuildModeDe extends TranslationsBuildModeEn {
	_TranslationsBuildModeDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get debug => 'Debug';
	@override String get profile => 'Profile';
	@override String get release => 'Release';
}

// Path: pwaStrategy
class _TranslationsPwaStrategyDe extends TranslationsPwaStrategyEn {
	_TranslationsPwaStrategyDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get kDefault => 'Standard';
	@override String get none => 'Keine';
}

// Path: language
class _TranslationsLanguageDe extends TranslationsLanguageEn {
	_TranslationsLanguageDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sprache';
	@override String get english => 'English';
	@override String get turkish => 'Türkçe';
	@override String get arabic => 'العربية';
	@override String get german => 'Deutsch';
	@override String get french => 'Français';
	@override String get chinese => '简体中文';
	@override String get russian => 'Русский';
	@override String get hindi => 'हिन्दी';
}

// Path: theme
class _TranslationsThemeDe extends TranslationsThemeEn {
	_TranslationsThemeDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Design';
	@override String get dark => 'Dunkel';
	@override String get light => 'Hell';
}

// Path: publish
class _TranslationsPublishDe extends TranslationsPublishEn {
	_TranslationsPublishDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get tab => 'Veröffentlichen';
	@override String get button => 'Veröffentlichen';
	@override String get target => 'Ziel';
	@override String get profile => 'Profil';
	@override String get releaseNotes => 'Release-Notizen';
	@override String get releaseNotesHint => 'Optionale Release-Notizen...';
	@override String get testerGroup => 'Testergruppe';
	@override String get testerGroupHint => 'z.B. testers';
	@override String get track => 'Track';
	@override String get noProfile => 'Kein Profil ausgewählt';
	@override String get noProject => 'Wählen Sie zuerst ein Projekt';
	@override String get noBuildOutput => 'Führen Sie zuerst einen Build aus, um Artefakte zu veröffentlichen';
	@override String get lastBuild => 'Letzter Build';
	@override String get configureNow => 'Jetzt konfigurieren';
	@override String get fastlaneMissing => 'Fastlane nicht gefunden';
	@override String get fastlaneMissingMessage => 'Fastlane wird für die Veröffentlichung benötigt. Installieren?';
	@override String get install => 'Installieren';
	@override String get configMissing => 'Fastlane-Konfiguration nicht gefunden';
	@override String get configMissingMessage => 'Fastlane-Konfiguration (Fastfile, Appfile) wird für die Veröffentlichung benötigt.';
	@override String get retry => 'Wiederholen';
	@override String get stop => 'Stoppen';
	@override String get publishLogTitle => 'Veröffentlichungs-Ausgabe';
	@override String get firebase => 'Firebase App Distribution';
	@override String get googlePlay => 'Google Play Console';
	@override String get appStoreConnect => 'App Store Connect (TestFlight)';
	@override String get internal => 'Intern';
	@override String get closed => 'Geschlossen';
	@override String get production => 'Produktion';
	@override String get publishProfiles => 'Veröffentlichungsprofile';
	@override String get configureProfile => 'Profil konfigurieren';
	@override String get newPublishProfile => 'Neues Veröffentlichungsprofil';
	@override String get firebaseAppId => 'Firebase App-ID';
	@override String get firebaseAppIdHint => '1:123:android:abc';
	@override String get firebaseToken => 'Firebase-Token (sicher gespeichert)';
	@override String get playPackageName => 'Paketname';
	@override String get playPackageNameHint => 'com.example.app';
	@override String get playServiceAccount => 'Pfad zur Service-Account-JSON';
	@override String get ascBundleId => 'Bundle-ID';
	@override String get ascBundleIdHint => 'com.example.app';
	@override String get ascAppleId => 'Apple ID (E-Mail)';
	@override String get ascAppleIdHint => 'developer@example.com';
	@override String get ascTeamId => 'Team-ID (Developer Portal)';
	@override String get ascItcTeamId => 'ITC Team-ID (App Store Connect)';
	@override String get ascApplePassword => 'App-spezifisches Passwort (sicher gespeichert)';
	@override String get ascApiKeyId => 'API-Key-ID';
	@override String get ascIssuerId => 'Issuer-ID';
	@override String get ascApiKeyPath => 'API-Key (.p8) Pfad';
	@override String get ascAppleIdAuth => 'Apple-ID-Authentifizierung';
	@override String get ascApiKeyAuth => 'API-Key-Authentifizierung (Alternative)';
	@override String get notificationSuccessTitle => '✅ Veröffentlichung erfolgreich!';
	@override String get notificationSuccessBody => 'Ihr Build wurde verteilt.';
	@override String notificationSuccessSubtitle({required Object platform, required Object track}) => 'Plattform: ${platform} • Track: ${track}';
	@override String notificationSuccessSubtitlePlatform({required Object platform}) => 'Plattform: ${platform}';
	@override String get notificationErrorTitle => '❌ Veröffentlichung fehlgeschlagen';
	@override String get notificationErrorSubtitle => 'BuildPaw';
	@override String get notificationErrorBody => 'Details in den Logs prüfen.';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'BuildPaw',
			'common.cancel' => 'Abbrechen',
			'common.export' => 'Exportieren',
			'common.browse' => 'Durchsuchen',
			'common.save' => 'Speichern',
			'common.delete' => 'Löschen',
			'projectSelector.title' => 'BuildPaw',
			'projectSelector.hint' => 'Flutter-Projektverzeichnis auswählen...',
			'projectSelector.selectDialogTitle' => 'Flutter-Projekt auswählen',
			'projectInfo.title' => 'Projektinfo',
			'projectInfo.generalTab' => 'Allgemein',
			'projectInfo.dependenciesTab' => 'Abhängigkeiten',
			'projectInfo.refreshTooltip' => 'Projektinfo aktualisieren',
			'projectInfo.fvmActive' => 'FVM Aktiv',
			'projectInfo.fvmInactive' => 'Kein FVM',
			'projectInfo.noDependencies' => 'Keine Abhängigkeiten gefunden',
			'projectInfo.package' => 'Paket',
			'projectInfo.version' => 'Version',
			'config.export' => 'Konfiguration exportieren',
			'config.import' => 'Konfiguration importieren',
			'config.exportSuccess' => ({required Object path}) => 'Konfiguration exportiert nach ${path}',
			'config.exportCancelled' => 'Export abgebrochen.',
			'config.importSuccess' => ({required Object name}) => 'Importiert: ${name}',
			'config.importCancelled' => 'Import abgebrochen oder Datei ungültig.',
			'config.dropToImport' => 'JSON-Datei zum Importieren ablegen',
			'exportDialog.title' => 'Build-Konfiguration exportieren',
			'exportDialog.presetName' => 'Voreinstellungsname',
			'exportDialog.presetNameHint' => 'z.B. release-prod',
			'exportDialog.version' => 'Version',
			'exportDialog.versionHint' => 'z.B. 1.0.0',
			'profile.title' => 'Profile',
			'profile.noProfiles' => 'Keine gespeicherten Profile',
			'profile.saveProfile' => 'Profil speichern',
			'profile.newProfile' => 'Neues Profil',
			'profile.profileName' => 'Profilname',
			'profile.profileNameHint' => 'z.B. release-prod',
			'profile.version' => 'Version',
			'profile.versionHint' => 'z.B. 1.0.0',
			'profile.saveSuccess' => ({required Object name}) => 'Profil \'${name}\' gespeichert',
			'profile.deleteConfirm' => ({required Object name}) => 'Profil \'${name}\' löschen?',
			'profile.deleteSuccess' => 'Profil gelöscht',
			'profile.applied' => ({required Object name}) => 'Profil \'${name}\' angewendet',
			'profile.updateExisting' => 'Vorhandenes aktualisieren',
			'profile.saveAsNew' => 'Als neu speichern',
			'profile.overwriteConfirm' => ({required Object name}) => 'Profil \'${name}\' existiert bereits. Überschreiben?',
			'build.button' => 'BAUEN',
			'build.building' => 'Wird gebaut...',
			'build.buildingPlatform' => ({required Object platform, required Object completed, required Object total}) => '${platform} wird gebaut... (${completed}/${total})',
			'build.cancel' => 'Abbrechen',
			'buildLog.title' => 'Build-Ausgabe',
			'buildLog.copyTooltip' => 'Logs kopieren',
			'buildLog.copied' => 'Logs in Zwischenablage kopiert',
			'buildLog.placeholder' => 'Build-Ausgabe erscheint hier...',
			'buildStatus.idle' => 'Inaktiv',
			'buildStatus.running' => 'Läuft',
			'buildStatus.success' => 'Erfolg',
			'buildStatus.failed' => 'Fehlgeschlagen',
			'platforms.android' => 'Android',
			'platforms.ios' => 'iOS',
			'platforms.web' => 'Web',
			'platformConfig.outputType' => 'Ausgabetyp',
			'platformConfig.codeObfuscation' => 'Code-Verschleierung',
			'platformConfig.splitDebugInfo' => 'Split Debug Info',
			'platformConfig.flavor' => 'Flavor',
			'platformConfig.flavorHint' => 'z.B. dev, staging, prod',
			'platformConfig.runMode' => 'Ausführungsmodus',
			'platformConfig.target' => 'Ziel',
			'platformConfig.targetHint' => 'lib/main.dart',
			'platformConfig.pwaStrategy' => 'PWA-Strategie',
			'platformConfig.noTreeShakeIcons' => 'No Tree Shake Icons',
			'androidOutput.apk' => 'Nur APK',
			'androidOutput.aab' => 'Nur AAB',
			'androidOutput.both' => 'APK & AAB',
			'iosOutput.ios' => 'iOS (Runner.app)',
			'iosOutput.ipa' => 'IPA (Exportierbar)',
			'buildMode.debug' => 'Debug',
			'buildMode.profile' => 'Profile',
			'buildMode.release' => 'Release',
			'pwaStrategy.kDefault' => 'Standard',
			'pwaStrategy.none' => 'Keine',
			'language.title' => 'Sprache',
			'language.english' => 'English',
			'language.turkish' => 'Türkçe',
			'language.arabic' => 'العربية',
			'language.german' => 'Deutsch',
			'language.french' => 'Français',
			'language.chinese' => '简体中文',
			'language.russian' => 'Русский',
			'language.hindi' => 'हिन्दी',
			'theme.title' => 'Design',
			'theme.dark' => 'Dunkel',
			'theme.light' => 'Hell',
			'publish.tab' => 'Veröffentlichen',
			'publish.button' => 'Veröffentlichen',
			'publish.target' => 'Ziel',
			'publish.profile' => 'Profil',
			'publish.releaseNotes' => 'Release-Notizen',
			'publish.releaseNotesHint' => 'Optionale Release-Notizen...',
			'publish.testerGroup' => 'Testergruppe',
			'publish.testerGroupHint' => 'z.B. testers',
			'publish.track' => 'Track',
			'publish.noProfile' => 'Kein Profil ausgewählt',
			'publish.noProject' => 'Wählen Sie zuerst ein Projekt',
			'publish.noBuildOutput' => 'Führen Sie zuerst einen Build aus, um Artefakte zu veröffentlichen',
			'publish.lastBuild' => 'Letzter Build',
			'publish.configureNow' => 'Jetzt konfigurieren',
			'publish.fastlaneMissing' => 'Fastlane nicht gefunden',
			'publish.fastlaneMissingMessage' => 'Fastlane wird für die Veröffentlichung benötigt. Installieren?',
			'publish.install' => 'Installieren',
			'publish.configMissing' => 'Fastlane-Konfiguration nicht gefunden',
			'publish.configMissingMessage' => 'Fastlane-Konfiguration (Fastfile, Appfile) wird für die Veröffentlichung benötigt.',
			'publish.retry' => 'Wiederholen',
			'publish.stop' => 'Stoppen',
			'publish.publishLogTitle' => 'Veröffentlichungs-Ausgabe',
			'publish.firebase' => 'Firebase App Distribution',
			'publish.googlePlay' => 'Google Play Console',
			'publish.appStoreConnect' => 'App Store Connect (TestFlight)',
			'publish.internal' => 'Intern',
			'publish.closed' => 'Geschlossen',
			'publish.production' => 'Produktion',
			'publish.publishProfiles' => 'Veröffentlichungsprofile',
			'publish.configureProfile' => 'Profil konfigurieren',
			'publish.newPublishProfile' => 'Neues Veröffentlichungsprofil',
			'publish.firebaseAppId' => 'Firebase App-ID',
			'publish.firebaseAppIdHint' => '1:123:android:abc',
			'publish.firebaseToken' => 'Firebase-Token (sicher gespeichert)',
			'publish.playPackageName' => 'Paketname',
			'publish.playPackageNameHint' => 'com.example.app',
			'publish.playServiceAccount' => 'Pfad zur Service-Account-JSON',
			'publish.ascBundleId' => 'Bundle-ID',
			'publish.ascBundleIdHint' => 'com.example.app',
			'publish.ascAppleId' => 'Apple ID (E-Mail)',
			'publish.ascAppleIdHint' => 'developer@example.com',
			'publish.ascTeamId' => 'Team-ID (Developer Portal)',
			'publish.ascItcTeamId' => 'ITC Team-ID (App Store Connect)',
			'publish.ascApplePassword' => 'App-spezifisches Passwort (sicher gespeichert)',
			'publish.ascApiKeyId' => 'API-Key-ID',
			'publish.ascIssuerId' => 'Issuer-ID',
			'publish.ascApiKeyPath' => 'API-Key (.p8) Pfad',
			'publish.ascAppleIdAuth' => 'Apple-ID-Authentifizierung',
			'publish.ascApiKeyAuth' => 'API-Key-Authentifizierung (Alternative)',
			'publish.notificationSuccessTitle' => '✅ Veröffentlichung erfolgreich!',
			'publish.notificationSuccessBody' => 'Ihr Build wurde verteilt.',
			'publish.notificationSuccessSubtitle' => ({required Object platform, required Object track}) => 'Plattform: ${platform} • Track: ${track}',
			'publish.notificationSuccessSubtitlePlatform' => ({required Object platform}) => 'Plattform: ${platform}',
			'publish.notificationErrorTitle' => '❌ Veröffentlichung fehlgeschlagen',
			'publish.notificationErrorSubtitle' => 'BuildPaw',
			'publish.notificationErrorBody' => 'Details in den Logs prüfen.',
			_ => null,
		};
	}
}
