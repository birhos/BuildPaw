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
class TranslationsFr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppFr app = _TranslationsAppFr._(_root);
	@override late final _TranslationsCommonFr common = _TranslationsCommonFr._(_root);
	@override late final _TranslationsProjectSelectorFr projectSelector = _TranslationsProjectSelectorFr._(_root);
	@override late final _TranslationsProjectInfoFr projectInfo = _TranslationsProjectInfoFr._(_root);
	@override late final _TranslationsConfigFr config = _TranslationsConfigFr._(_root);
	@override late final _TranslationsExportDialogFr exportDialog = _TranslationsExportDialogFr._(_root);
	@override late final _TranslationsProfileFr profile = _TranslationsProfileFr._(_root);
	@override late final _TranslationsBuildFr build = _TranslationsBuildFr._(_root);
	@override late final _TranslationsBuildLogFr buildLog = _TranslationsBuildLogFr._(_root);
	@override late final _TranslationsBuildStatusFr buildStatus = _TranslationsBuildStatusFr._(_root);
	@override late final _TranslationsPlatformsFr platforms = _TranslationsPlatformsFr._(_root);
	@override late final _TranslationsPlatformConfigFr platformConfig = _TranslationsPlatformConfigFr._(_root);
	@override late final _TranslationsAndroidOutputFr androidOutput = _TranslationsAndroidOutputFr._(_root);
	@override late final _TranslationsIosOutputFr iosOutput = _TranslationsIosOutputFr._(_root);
	@override late final _TranslationsBuildModeFr buildMode = _TranslationsBuildModeFr._(_root);
	@override late final _TranslationsPwaStrategyFr pwaStrategy = _TranslationsPwaStrategyFr._(_root);
	@override late final _TranslationsLanguageFr language = _TranslationsLanguageFr._(_root);
	@override late final _TranslationsThemeFr theme = _TranslationsThemeFr._(_root);
	@override late final _TranslationsPublishFr publish = _TranslationsPublishFr._(_root);
}

// Path: app
class _TranslationsAppFr extends TranslationsAppEn {
	_TranslationsAppFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'BuildPaw';
}

// Path: common
class _TranslationsCommonFr extends TranslationsCommonEn {
	_TranslationsCommonFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Annuler';
	@override String get export => 'Exporter';
	@override String get browse => 'Parcourir';
	@override String get save => 'Enregistrer';
	@override String get delete => 'Supprimer';
}

// Path: projectSelector
class _TranslationsProjectSelectorFr extends TranslationsProjectSelectorEn {
	_TranslationsProjectSelectorFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'BuildPaw';
	@override String get hint => 'Sélectionnez un répertoire de projet Flutter...';
	@override String get selectDialogTitle => 'Sélectionner un projet Flutter';
}

// Path: projectInfo
class _TranslationsProjectInfoFr extends TranslationsProjectInfoEn {
	_TranslationsProjectInfoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Info projet';
	@override String get generalTab => 'Général';
	@override String get dependenciesTab => 'Dépendances';
	@override String get refreshTooltip => 'Actualiser les infos du projet';
	@override String get fvmActive => 'FVM Actif';
	@override String get fvmInactive => 'Pas de FVM';
	@override String get noDependencies => 'Aucune dépendance trouvée';
	@override String get package => 'Paquet';
	@override String get version => 'Version';
}

// Path: config
class _TranslationsConfigFr extends TranslationsConfigEn {
	_TranslationsConfigFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get export => 'Exporter la config';
	@override String get import => 'Importer la config';
	@override String exportSuccess({required Object path}) => 'Config exportée vers ${path}';
	@override String get exportCancelled => 'Export annulé.';
	@override String importSuccess({required Object name}) => 'Importé : ${name}';
	@override String get importCancelled => 'Import annulé ou fichier invalide.';
	@override String get dropToImport => 'Déposez un fichier JSON pour importer la config';
}

// Path: exportDialog
class _TranslationsExportDialogFr extends TranslationsExportDialogEn {
	_TranslationsExportDialogFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Exporter la config de build';
	@override String get presetName => 'Nom du préréglage';
	@override String get presetNameHint => 'ex. release-prod';
	@override String get version => 'Version';
	@override String get versionHint => 'ex. 1.0.0';
}

// Path: profile
class _TranslationsProfileFr extends TranslationsProfileEn {
	_TranslationsProfileFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profils';
	@override String get noProfiles => 'Aucun profil enregistré';
	@override String get saveProfile => 'Enregistrer le profil';
	@override String get newProfile => 'Nouveau profil';
	@override String get profileName => 'Nom du profil';
	@override String get profileNameHint => 'ex. release-prod';
	@override String get version => 'Version';
	@override String get versionHint => 'ex. 1.0.0';
	@override String saveSuccess({required Object name}) => 'Profil \'${name}\' enregistré';
	@override String deleteConfirm({required Object name}) => 'Supprimer le profil \'${name}\' ?';
	@override String get deleteSuccess => 'Profil supprimé';
	@override String applied({required Object name}) => 'Profil \'${name}\' appliqué';
	@override String get updateExisting => 'Mettre à jour existant';
	@override String get saveAsNew => 'Enregistrer comme nouveau';
	@override String overwriteConfirm({required Object name}) => 'Le profil \'${name}\' existe déjà. Écraser ?';
}

// Path: build
class _TranslationsBuildFr extends TranslationsBuildEn {
	_TranslationsBuildFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get button => 'COMPILER';
	@override String get building => 'Compilation...';
	@override String buildingPlatform({required Object platform, required Object completed, required Object total}) => 'Compilation de ${platform}... (${completed}/${total})';
	@override String get cancel => 'Annuler';
}

// Path: buildLog
class _TranslationsBuildLogFr extends TranslationsBuildLogEn {
	_TranslationsBuildLogFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sortie de compilation';
	@override String get copyTooltip => 'Copier les logs';
	@override String get copied => 'Logs copiés dans le presse-papiers';
	@override String get placeholder => 'La sortie de compilation apparaîtra ici...';
}

// Path: buildStatus
class _TranslationsBuildStatusFr extends TranslationsBuildStatusEn {
	_TranslationsBuildStatusFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get idle => 'Inactif';
	@override String get running => 'En cours';
	@override String get success => 'Succès';
	@override String get failed => 'Échec';
}

// Path: platforms
class _TranslationsPlatformsFr extends TranslationsPlatformsEn {
	_TranslationsPlatformsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get android => 'Android';
	@override String get ios => 'iOS';
	@override String get web => 'Web';
}

// Path: platformConfig
class _TranslationsPlatformConfigFr extends TranslationsPlatformConfigEn {
	_TranslationsPlatformConfigFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get outputType => 'Type de sortie';
	@override String get codeObfuscation => 'Obfuscation du code';
	@override String get splitDebugInfo => 'Split Debug Info';
	@override String get flavor => 'Flavor';
	@override String get flavorHint => 'ex. dev, staging, prod';
	@override String get runMode => 'Mode d\'exécution';
	@override String get target => 'Cible';
	@override String get targetHint => 'lib/main.dart';
	@override String get pwaStrategy => 'Stratégie PWA';
	@override String get noTreeShakeIcons => 'No Tree Shake Icons';
}

// Path: androidOutput
class _TranslationsAndroidOutputFr extends TranslationsAndroidOutputEn {
	_TranslationsAndroidOutputFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get apk => 'APK uniquement';
	@override String get aab => 'AAB uniquement';
	@override String get both => 'APK & AAB';
}

// Path: iosOutput
class _TranslationsIosOutputFr extends TranslationsIosOutputEn {
	_TranslationsIosOutputFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get ios => 'iOS (Runner.app)';
	@override String get ipa => 'IPA (Exportable)';
}

// Path: buildMode
class _TranslationsBuildModeFr extends TranslationsBuildModeEn {
	_TranslationsBuildModeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get debug => 'Debug';
	@override String get profile => 'Profile';
	@override String get release => 'Release';
}

// Path: pwaStrategy
class _TranslationsPwaStrategyFr extends TranslationsPwaStrategyEn {
	_TranslationsPwaStrategyFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get kDefault => 'Par défaut';
	@override String get none => 'Aucune';
}

// Path: language
class _TranslationsLanguageFr extends TranslationsLanguageEn {
	_TranslationsLanguageFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Langue';
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
class _TranslationsThemeFr extends TranslationsThemeEn {
	_TranslationsThemeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Thème';
	@override String get dark => 'Sombre';
	@override String get light => 'Clair';
}

// Path: publish
class _TranslationsPublishFr extends TranslationsPublishEn {
	_TranslationsPublishFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tab => 'Publier';
	@override String get button => 'Publier';
	@override String get target => 'Cible';
	@override String get profile => 'Profil';
	@override String get releaseNotes => 'Notes de version';
	@override String get releaseNotesHint => 'Notes de version facultatives...';
	@override String get testerGroup => 'Groupe de testeurs';
	@override String get testerGroupHint => 'ex. testers';
	@override String get track => 'Piste';
	@override String get noProfile => 'Aucun profil sélectionné';
	@override String get noProject => 'Sélectionnez d\'abord un projet';
	@override String get noBuildOutput => 'Effectuez d\'abord une compilation pour publier les artefacts';
	@override String get lastBuild => 'Dernière compilation';
	@override String get configureNow => 'Configurer maintenant';
	@override String get fastlaneMissing => 'Fastlane introuvable';
	@override String get fastlaneMissingMessage => 'Fastlane est requis pour la publication. L\'installer ?';
	@override String get install => 'Installer';
	@override String get configMissing => 'Configuration Fastlane introuvable';
	@override String get configMissingMessage => 'La configuration Fastlane (Fastfile, Appfile) est requise pour la publication.';
	@override String get retry => 'Réessayer';
	@override String get stop => 'Arrêter';
	@override String get publishLogTitle => 'Sortie de publication';
	@override String get firebase => 'Firebase App Distribution';
	@override String get googlePlay => 'Google Play Console';
	@override String get appStoreConnect => 'App Store Connect (TestFlight)';
	@override String get internal => 'Interne';
	@override String get closed => 'Fermé';
	@override String get production => 'Production';
	@override String get publishProfiles => 'Profils de publication';
	@override String get configureProfile => 'Configurer le profil';
	@override String get newPublishProfile => 'Nouveau profil de publication';
	@override String get firebaseAppId => 'ID d\'application Firebase';
	@override String get firebaseAppIdHint => '1:123:android:abc';
	@override String get firebaseToken => 'Token Firebase (stocké de manière sécurisée)';
	@override String get playPackageName => 'Nom du paquet';
	@override String get playPackageNameHint => 'com.example.app';
	@override String get playServiceAccount => 'Chemin du JSON du compte de service';
	@override String get ascBundleId => 'ID de bundle';
	@override String get ascBundleIdHint => 'com.example.app';
	@override String get ascAppleId => 'Apple ID (e-mail)';
	@override String get ascAppleIdHint => 'developer@example.com';
	@override String get ascTeamId => 'ID d\'équipe (Developer Portal)';
	@override String get ascItcTeamId => 'ID d\'équipe ITC (App Store Connect)';
	@override String get ascApplePassword => 'Mot de passe spécifique à l\'app (stocké de manière sécurisée)';
	@override String get ascApiKeyId => 'ID de clé API';
	@override String get ascIssuerId => 'ID d\'émetteur';
	@override String get ascApiKeyPath => 'Chemin de la clé API (.p8)';
	@override String get ascAppleIdAuth => 'Authentification Apple ID';
	@override String get ascApiKeyAuth => 'Authentification par clé API (alternative)';
	@override String get notificationSuccessTitle => '✅ Publication réussie !';
	@override String get notificationSuccessBody => 'Votre build a été distribué.';
	@override String notificationSuccessSubtitle({required Object platform, required Object track}) => 'Plateforme : ${platform} • Piste : ${track}';
	@override String notificationSuccessSubtitlePlatform({required Object platform}) => 'Plateforme : ${platform}';
	@override String get notificationErrorTitle => '❌ Publication échouée';
	@override String get notificationErrorSubtitle => 'BuildPaw';
	@override String get notificationErrorBody => 'Consultez les logs pour plus de détails.';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'BuildPaw',
			'common.cancel' => 'Annuler',
			'common.export' => 'Exporter',
			'common.browse' => 'Parcourir',
			'common.save' => 'Enregistrer',
			'common.delete' => 'Supprimer',
			'projectSelector.title' => 'BuildPaw',
			'projectSelector.hint' => 'Sélectionnez un répertoire de projet Flutter...',
			'projectSelector.selectDialogTitle' => 'Sélectionner un projet Flutter',
			'projectInfo.title' => 'Info projet',
			'projectInfo.generalTab' => 'Général',
			'projectInfo.dependenciesTab' => 'Dépendances',
			'projectInfo.refreshTooltip' => 'Actualiser les infos du projet',
			'projectInfo.fvmActive' => 'FVM Actif',
			'projectInfo.fvmInactive' => 'Pas de FVM',
			'projectInfo.noDependencies' => 'Aucune dépendance trouvée',
			'projectInfo.package' => 'Paquet',
			'projectInfo.version' => 'Version',
			'config.export' => 'Exporter la config',
			'config.import' => 'Importer la config',
			'config.exportSuccess' => ({required Object path}) => 'Config exportée vers ${path}',
			'config.exportCancelled' => 'Export annulé.',
			'config.importSuccess' => ({required Object name}) => 'Importé : ${name}',
			'config.importCancelled' => 'Import annulé ou fichier invalide.',
			'config.dropToImport' => 'Déposez un fichier JSON pour importer la config',
			'exportDialog.title' => 'Exporter la config de build',
			'exportDialog.presetName' => 'Nom du préréglage',
			'exportDialog.presetNameHint' => 'ex. release-prod',
			'exportDialog.version' => 'Version',
			'exportDialog.versionHint' => 'ex. 1.0.0',
			'profile.title' => 'Profils',
			'profile.noProfiles' => 'Aucun profil enregistré',
			'profile.saveProfile' => 'Enregistrer le profil',
			'profile.newProfile' => 'Nouveau profil',
			'profile.profileName' => 'Nom du profil',
			'profile.profileNameHint' => 'ex. release-prod',
			'profile.version' => 'Version',
			'profile.versionHint' => 'ex. 1.0.0',
			'profile.saveSuccess' => ({required Object name}) => 'Profil \'${name}\' enregistré',
			'profile.deleteConfirm' => ({required Object name}) => 'Supprimer le profil \'${name}\' ?',
			'profile.deleteSuccess' => 'Profil supprimé',
			'profile.applied' => ({required Object name}) => 'Profil \'${name}\' appliqué',
			'profile.updateExisting' => 'Mettre à jour existant',
			'profile.saveAsNew' => 'Enregistrer comme nouveau',
			'profile.overwriteConfirm' => ({required Object name}) => 'Le profil \'${name}\' existe déjà. Écraser ?',
			'build.button' => 'COMPILER',
			'build.building' => 'Compilation...',
			'build.buildingPlatform' => ({required Object platform, required Object completed, required Object total}) => 'Compilation de ${platform}... (${completed}/${total})',
			'build.cancel' => 'Annuler',
			'buildLog.title' => 'Sortie de compilation',
			'buildLog.copyTooltip' => 'Copier les logs',
			'buildLog.copied' => 'Logs copiés dans le presse-papiers',
			'buildLog.placeholder' => 'La sortie de compilation apparaîtra ici...',
			'buildStatus.idle' => 'Inactif',
			'buildStatus.running' => 'En cours',
			'buildStatus.success' => 'Succès',
			'buildStatus.failed' => 'Échec',
			'platforms.android' => 'Android',
			'platforms.ios' => 'iOS',
			'platforms.web' => 'Web',
			'platformConfig.outputType' => 'Type de sortie',
			'platformConfig.codeObfuscation' => 'Obfuscation du code',
			'platformConfig.splitDebugInfo' => 'Split Debug Info',
			'platformConfig.flavor' => 'Flavor',
			'platformConfig.flavorHint' => 'ex. dev, staging, prod',
			'platformConfig.runMode' => 'Mode d\'exécution',
			'platformConfig.target' => 'Cible',
			'platformConfig.targetHint' => 'lib/main.dart',
			'platformConfig.pwaStrategy' => 'Stratégie PWA',
			'platformConfig.noTreeShakeIcons' => 'No Tree Shake Icons',
			'androidOutput.apk' => 'APK uniquement',
			'androidOutput.aab' => 'AAB uniquement',
			'androidOutput.both' => 'APK & AAB',
			'iosOutput.ios' => 'iOS (Runner.app)',
			'iosOutput.ipa' => 'IPA (Exportable)',
			'buildMode.debug' => 'Debug',
			'buildMode.profile' => 'Profile',
			'buildMode.release' => 'Release',
			'pwaStrategy.kDefault' => 'Par défaut',
			'pwaStrategy.none' => 'Aucune',
			'language.title' => 'Langue',
			'language.english' => 'English',
			'language.turkish' => 'Türkçe',
			'language.arabic' => 'العربية',
			'language.german' => 'Deutsch',
			'language.french' => 'Français',
			'language.chinese' => '简体中文',
			'language.russian' => 'Русский',
			'language.hindi' => 'हिन्दी',
			'theme.title' => 'Thème',
			'theme.dark' => 'Sombre',
			'theme.light' => 'Clair',
			'publish.tab' => 'Publier',
			'publish.button' => 'Publier',
			'publish.target' => 'Cible',
			'publish.profile' => 'Profil',
			'publish.releaseNotes' => 'Notes de version',
			'publish.releaseNotesHint' => 'Notes de version facultatives...',
			'publish.testerGroup' => 'Groupe de testeurs',
			'publish.testerGroupHint' => 'ex. testers',
			'publish.track' => 'Piste',
			'publish.noProfile' => 'Aucun profil sélectionné',
			'publish.noProject' => 'Sélectionnez d\'abord un projet',
			'publish.noBuildOutput' => 'Effectuez d\'abord une compilation pour publier les artefacts',
			'publish.lastBuild' => 'Dernière compilation',
			'publish.configureNow' => 'Configurer maintenant',
			'publish.fastlaneMissing' => 'Fastlane introuvable',
			'publish.fastlaneMissingMessage' => 'Fastlane est requis pour la publication. L\'installer ?',
			'publish.install' => 'Installer',
			'publish.configMissing' => 'Configuration Fastlane introuvable',
			'publish.configMissingMessage' => 'La configuration Fastlane (Fastfile, Appfile) est requise pour la publication.',
			'publish.retry' => 'Réessayer',
			'publish.stop' => 'Arrêter',
			'publish.publishLogTitle' => 'Sortie de publication',
			'publish.firebase' => 'Firebase App Distribution',
			'publish.googlePlay' => 'Google Play Console',
			'publish.appStoreConnect' => 'App Store Connect (TestFlight)',
			'publish.internal' => 'Interne',
			'publish.closed' => 'Fermé',
			'publish.production' => 'Production',
			'publish.publishProfiles' => 'Profils de publication',
			'publish.configureProfile' => 'Configurer le profil',
			'publish.newPublishProfile' => 'Nouveau profil de publication',
			'publish.firebaseAppId' => 'ID d\'application Firebase',
			'publish.firebaseAppIdHint' => '1:123:android:abc',
			'publish.firebaseToken' => 'Token Firebase (stocké de manière sécurisée)',
			'publish.playPackageName' => 'Nom du paquet',
			'publish.playPackageNameHint' => 'com.example.app',
			'publish.playServiceAccount' => 'Chemin du JSON du compte de service',
			'publish.ascBundleId' => 'ID de bundle',
			'publish.ascBundleIdHint' => 'com.example.app',
			'publish.ascAppleId' => 'Apple ID (e-mail)',
			'publish.ascAppleIdHint' => 'developer@example.com',
			'publish.ascTeamId' => 'ID d\'équipe (Developer Portal)',
			'publish.ascItcTeamId' => 'ID d\'équipe ITC (App Store Connect)',
			'publish.ascApplePassword' => 'Mot de passe spécifique à l\'app (stocké de manière sécurisée)',
			'publish.ascApiKeyId' => 'ID de clé API',
			'publish.ascIssuerId' => 'ID d\'émetteur',
			'publish.ascApiKeyPath' => 'Chemin de la clé API (.p8)',
			'publish.ascAppleIdAuth' => 'Authentification Apple ID',
			'publish.ascApiKeyAuth' => 'Authentification par clé API (alternative)',
			'publish.notificationSuccessTitle' => '✅ Publication réussie !',
			'publish.notificationSuccessBody' => 'Votre build a été distribué.',
			'publish.notificationSuccessSubtitle' => ({required Object platform, required Object track}) => 'Plateforme : ${platform} • Piste : ${track}',
			'publish.notificationSuccessSubtitlePlatform' => ({required Object platform}) => 'Plateforme : ${platform}',
			'publish.notificationErrorTitle' => '❌ Publication échouée',
			'publish.notificationErrorSubtitle' => 'BuildPaw',
			'publish.notificationErrorBody' => 'Consultez les logs pour plus de détails.',
			_ => null,
		};
	}
}
