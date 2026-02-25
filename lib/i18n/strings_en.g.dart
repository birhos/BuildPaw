///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEn app = TranslationsAppEn.internal(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsProjectSelectorEn projectSelector = TranslationsProjectSelectorEn.internal(_root);
	late final TranslationsProjectInfoEn projectInfo = TranslationsProjectInfoEn.internal(_root);
	late final TranslationsConfigEn config = TranslationsConfigEn.internal(_root);
	late final TranslationsExportDialogEn exportDialog = TranslationsExportDialogEn.internal(_root);
	late final TranslationsBuildEn build = TranslationsBuildEn.internal(_root);
	late final TranslationsBuildLogEn buildLog = TranslationsBuildLogEn.internal(_root);
	late final TranslationsBuildStatusEn buildStatus = TranslationsBuildStatusEn.internal(_root);
	late final TranslationsPlatformsEn platforms = TranslationsPlatformsEn.internal(_root);
	late final TranslationsPlatformConfigEn platformConfig = TranslationsPlatformConfigEn.internal(_root);
	late final TranslationsAndroidOutputEn androidOutput = TranslationsAndroidOutputEn.internal(_root);
	late final TranslationsIosOutputEn iosOutput = TranslationsIosOutputEn.internal(_root);
	late final TranslationsBuildModeEn buildMode = TranslationsBuildModeEn.internal(_root);
	late final TranslationsPwaStrategyEn pwaStrategy = TranslationsPwaStrategyEn.internal(_root);
	late final TranslationsLanguageEn language = TranslationsLanguageEn.internal(_root);
	late final TranslationsThemeEn theme = TranslationsThemeEn.internal(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'BuildPaw'
	String get name => 'BuildPaw';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Export'
	String get export => 'Export';

	/// en: 'Browse'
	String get browse => 'Browse';
}

// Path: projectSelector
class TranslationsProjectSelectorEn {
	TranslationsProjectSelectorEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'BuildPaw'
	String get title => 'BuildPaw';

	/// en: 'Select a Flutter project directory...'
	String get hint => 'Select a Flutter project directory...';

	/// en: 'Select Flutter Project'
	String get selectDialogTitle => 'Select Flutter Project';
}

// Path: projectInfo
class TranslationsProjectInfoEn {
	TranslationsProjectInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Project Info'
	String get title => 'Project Info';

	/// en: 'Refresh project info'
	String get refreshTooltip => 'Refresh project info';

	/// en: 'FVM Active'
	String get fvmActive => 'FVM Active';

	/// en: 'No FVM'
	String get fvmInactive => 'No FVM';
}

// Path: config
class TranslationsConfigEn {
	TranslationsConfigEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Export Config'
	String get export => 'Export Config';

	/// en: 'Import Config'
	String get import => 'Import Config';

	/// en: 'Config exported to $path'
	String exportSuccess({required Object path}) => 'Config exported to ${path}';

	/// en: 'Export cancelled.'
	String get exportCancelled => 'Export cancelled.';

	/// en: 'Imported: $name'
	String importSuccess({required Object name}) => 'Imported: ${name}';

	/// en: 'Import cancelled or file invalid.'
	String get importCancelled => 'Import cancelled or file invalid.';

	/// en: 'Drop JSON file to import config'
	String get dropToImport => 'Drop JSON file to import config';
}

// Path: exportDialog
class TranslationsExportDialogEn {
	TranslationsExportDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Export Build Config'
	String get title => 'Export Build Config';

	/// en: 'Preset Name'
	String get presetName => 'Preset Name';

	/// en: 'e.g. release-prod'
	String get presetNameHint => 'e.g. release-prod';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'e.g. 1.0.0'
	String get versionHint => 'e.g. 1.0.0';
}

// Path: build
class TranslationsBuildEn {
	TranslationsBuildEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'BUILD'
	String get button => 'BUILD';

	/// en: 'Building...'
	String get building => 'Building...';

	/// en: 'Building $platform... ($completed/$total)'
	String buildingPlatform({required Object platform, required Object completed, required Object total}) => 'Building ${platform}... (${completed}/${total})';

	/// en: 'Cancel'
	String get cancel => 'Cancel';
}

// Path: buildLog
class TranslationsBuildLogEn {
	TranslationsBuildLogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Build Output'
	String get title => 'Build Output';

	/// en: 'Copy logs'
	String get copyTooltip => 'Copy logs';

	/// en: 'Logs copied to clipboard'
	String get copied => 'Logs copied to clipboard';

	/// en: 'Build output will appear here...'
	String get placeholder => 'Build output will appear here...';
}

// Path: buildStatus
class TranslationsBuildStatusEn {
	TranslationsBuildStatusEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Idle'
	String get idle => 'Idle';

	/// en: 'Running'
	String get running => 'Running';

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Failed'
	String get failed => 'Failed';
}

// Path: platforms
class TranslationsPlatformsEn {
	TranslationsPlatformsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Android'
	String get android => 'Android';

	/// en: 'iOS'
	String get ios => 'iOS';

	/// en: 'Web'
	String get web => 'Web';
}

// Path: platformConfig
class TranslationsPlatformConfigEn {
	TranslationsPlatformConfigEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Output Type'
	String get outputType => 'Output Type';

	/// en: 'Code Obfuscation'
	String get codeObfuscation => 'Code Obfuscation';

	/// en: 'Split Debug Info'
	String get splitDebugInfo => 'Split Debug Info';

	/// en: 'Flavor'
	String get flavor => 'Flavor';

	/// en: 'e.g. dev, staging, prod'
	String get flavorHint => 'e.g. dev, staging, prod';

	/// en: 'Run Mode'
	String get runMode => 'Run Mode';

	/// en: 'Target'
	String get target => 'Target';

	/// en: 'lib/main.dart'
	String get targetHint => 'lib/main.dart';

	/// en: 'PWA Strategy'
	String get pwaStrategy => 'PWA Strategy';

	/// en: 'No Tree Shake Icons'
	String get noTreeShakeIcons => 'No Tree Shake Icons';
}

// Path: androidOutput
class TranslationsAndroidOutputEn {
	TranslationsAndroidOutputEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Only APK'
	String get apk => 'Only APK';

	/// en: 'Only AAB'
	String get aab => 'Only AAB';

	/// en: 'APK & AAB'
	String get both => 'APK & AAB';
}

// Path: iosOutput
class TranslationsIosOutputEn {
	TranslationsIosOutputEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'iOS (Runner.app)'
	String get ios => 'iOS (Runner.app)';

	/// en: 'IPA (Exportable)'
	String get ipa => 'IPA (Exportable)';
}

// Path: buildMode
class TranslationsBuildModeEn {
	TranslationsBuildModeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Debug'
	String get debug => 'Debug';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Release'
	String get release => 'Release';
}

// Path: pwaStrategy
class TranslationsPwaStrategyEn {
	TranslationsPwaStrategyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Default'
	String get kDefault => 'Default';

	/// en: 'None'
	String get none => 'None';
}

// Path: language
class TranslationsLanguageEn {
	TranslationsLanguageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language'
	String get title => 'Language';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Türkçe'
	String get turkish => 'Türkçe';
}

// Path: theme
class TranslationsThemeEn {
	TranslationsThemeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Theme'
	String get title => 'Theme';

	/// en: 'Dark'
	String get dark => 'Dark';

	/// en: 'Light'
	String get light => 'Light';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'BuildPaw',
			'common.cancel' => 'Cancel',
			'common.export' => 'Export',
			'common.browse' => 'Browse',
			'projectSelector.title' => 'BuildPaw',
			'projectSelector.hint' => 'Select a Flutter project directory...',
			'projectSelector.selectDialogTitle' => 'Select Flutter Project',
			'projectInfo.title' => 'Project Info',
			'projectInfo.refreshTooltip' => 'Refresh project info',
			'projectInfo.fvmActive' => 'FVM Active',
			'projectInfo.fvmInactive' => 'No FVM',
			'config.export' => 'Export Config',
			'config.import' => 'Import Config',
			'config.exportSuccess' => ({required Object path}) => 'Config exported to ${path}',
			'config.exportCancelled' => 'Export cancelled.',
			'config.importSuccess' => ({required Object name}) => 'Imported: ${name}',
			'config.importCancelled' => 'Import cancelled or file invalid.',
			'config.dropToImport' => 'Drop JSON file to import config',
			'exportDialog.title' => 'Export Build Config',
			'exportDialog.presetName' => 'Preset Name',
			'exportDialog.presetNameHint' => 'e.g. release-prod',
			'exportDialog.version' => 'Version',
			'exportDialog.versionHint' => 'e.g. 1.0.0',
			'build.button' => 'BUILD',
			'build.building' => 'Building...',
			'build.buildingPlatform' => ({required Object platform, required Object completed, required Object total}) => 'Building ${platform}... (${completed}/${total})',
			'build.cancel' => 'Cancel',
			'buildLog.title' => 'Build Output',
			'buildLog.copyTooltip' => 'Copy logs',
			'buildLog.copied' => 'Logs copied to clipboard',
			'buildLog.placeholder' => 'Build output will appear here...',
			'buildStatus.idle' => 'Idle',
			'buildStatus.running' => 'Running',
			'buildStatus.success' => 'Success',
			'buildStatus.failed' => 'Failed',
			'platforms.android' => 'Android',
			'platforms.ios' => 'iOS',
			'platforms.web' => 'Web',
			'platformConfig.outputType' => 'Output Type',
			'platformConfig.codeObfuscation' => 'Code Obfuscation',
			'platformConfig.splitDebugInfo' => 'Split Debug Info',
			'platformConfig.flavor' => 'Flavor',
			'platformConfig.flavorHint' => 'e.g. dev, staging, prod',
			'platformConfig.runMode' => 'Run Mode',
			'platformConfig.target' => 'Target',
			'platformConfig.targetHint' => 'lib/main.dart',
			'platformConfig.pwaStrategy' => 'PWA Strategy',
			'platformConfig.noTreeShakeIcons' => 'No Tree Shake Icons',
			'androidOutput.apk' => 'Only APK',
			'androidOutput.aab' => 'Only AAB',
			'androidOutput.both' => 'APK & AAB',
			'iosOutput.ios' => 'iOS (Runner.app)',
			'iosOutput.ipa' => 'IPA (Exportable)',
			'buildMode.debug' => 'Debug',
			'buildMode.profile' => 'Profile',
			'buildMode.release' => 'Release',
			'pwaStrategy.kDefault' => 'Default',
			'pwaStrategy.none' => 'None',
			'language.title' => 'Language',
			'language.english' => 'English',
			'language.turkish' => 'Türkçe',
			'theme.title' => 'Theme',
			'theme.dark' => 'Dark',
			'theme.light' => 'Light',
			_ => null,
		};
	}
}
