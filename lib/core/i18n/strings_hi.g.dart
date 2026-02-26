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
class TranslationsHi extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.hi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsHi _root = this; // ignore: unused_field

	@override 
	TranslationsHi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHi(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppHi app = _TranslationsAppHi._(_root);
	@override late final _TranslationsCommonHi common = _TranslationsCommonHi._(_root);
	@override late final _TranslationsProjectSelectorHi projectSelector = _TranslationsProjectSelectorHi._(_root);
	@override late final _TranslationsProjectInfoHi projectInfo = _TranslationsProjectInfoHi._(_root);
	@override late final _TranslationsConfigHi config = _TranslationsConfigHi._(_root);
	@override late final _TranslationsExportDialogHi exportDialog = _TranslationsExportDialogHi._(_root);
	@override late final _TranslationsProfileHi profile = _TranslationsProfileHi._(_root);
	@override late final _TranslationsBuildHi build = _TranslationsBuildHi._(_root);
	@override late final _TranslationsBuildLogHi buildLog = _TranslationsBuildLogHi._(_root);
	@override late final _TranslationsBuildStatusHi buildStatus = _TranslationsBuildStatusHi._(_root);
	@override late final _TranslationsPlatformsHi platforms = _TranslationsPlatformsHi._(_root);
	@override late final _TranslationsPlatformConfigHi platformConfig = _TranslationsPlatformConfigHi._(_root);
	@override late final _TranslationsAndroidOutputHi androidOutput = _TranslationsAndroidOutputHi._(_root);
	@override late final _TranslationsIosOutputHi iosOutput = _TranslationsIosOutputHi._(_root);
	@override late final _TranslationsBuildModeHi buildMode = _TranslationsBuildModeHi._(_root);
	@override late final _TranslationsPwaStrategyHi pwaStrategy = _TranslationsPwaStrategyHi._(_root);
	@override late final _TranslationsLanguageHi language = _TranslationsLanguageHi._(_root);
	@override late final _TranslationsThemeHi theme = _TranslationsThemeHi._(_root);
}

// Path: app
class _TranslationsAppHi extends TranslationsAppEn {
	_TranslationsAppHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get name => 'BuildPaw';
}

// Path: common
class _TranslationsCommonHi extends TranslationsCommonEn {
	_TranslationsCommonHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'रद्द करें';
	@override String get export => 'निर्यात';
	@override String get browse => 'ब्राउज़';
	@override String get save => 'सहेजें';
	@override String get delete => 'हटाएं';
}

// Path: projectSelector
class _TranslationsProjectSelectorHi extends TranslationsProjectSelectorEn {
	_TranslationsProjectSelectorHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'BuildPaw';
	@override String get hint => 'Flutter प्रोजेक्ट डायरेक्टरी चुनें...';
	@override String get selectDialogTitle => 'Flutter प्रोजेक्ट चुनें';
}

// Path: projectInfo
class _TranslationsProjectInfoHi extends TranslationsProjectInfoEn {
	_TranslationsProjectInfoHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'प्रोजेक्ट जानकारी';
	@override String get generalTab => 'सामान्य';
	@override String get dependenciesTab => 'डिपेंडेंसी';
	@override String get refreshTooltip => 'प्रोजेक्ट जानकारी रीफ्रेश करें';
	@override String get fvmActive => 'FVM सक्रिय';
	@override String get fvmInactive => 'FVM नहीं';
	@override String get noDependencies => 'कोई डिपेंडेंसी नहीं मिली';
	@override String get package => 'पैकेज';
	@override String get version => 'संस्करण';
}

// Path: config
class _TranslationsConfigHi extends TranslationsConfigEn {
	_TranslationsConfigHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get export => 'कॉन्फ़िग निर्यात करें';
	@override String get import => 'कॉन्फ़िग आयात करें';
	@override String exportSuccess({required Object path}) => 'कॉन्फ़िग ${path} पर निर्यात किया गया';
	@override String get exportCancelled => 'निर्यात रद्द किया गया।';
	@override String importSuccess({required Object name}) => 'आयातित: ${name}';
	@override String get importCancelled => 'आयात रद्द किया गया या फ़ाइल अमान्य।';
	@override String get dropToImport => 'कॉन्फ़िग आयात करने के लिए JSON फ़ाइल छोड़ें';
}

// Path: exportDialog
class _TranslationsExportDialogHi extends TranslationsExportDialogEn {
	_TranslationsExportDialogHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'बिल्ड कॉन्फ़िग निर्यात करें';
	@override String get presetName => 'प्रीसेट नाम';
	@override String get presetNameHint => 'उदा. release-prod';
	@override String get version => 'संस्करण';
	@override String get versionHint => 'उदा. 1.0.0';
}

// Path: profile
class _TranslationsProfileHi extends TranslationsProfileEn {
	_TranslationsProfileHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'प्रोफ़ाइल';
	@override String get noProfiles => 'कोई सहेजी गई प्रोफ़ाइल नहीं';
	@override String get saveProfile => 'प्रोफ़ाइल सहेजें';
	@override String get newProfile => 'नई प्रोफ़ाइल';
	@override String get profileName => 'प्रोफ़ाइल नाम';
	@override String get profileNameHint => 'उदा. release-prod';
	@override String get version => 'संस्करण';
	@override String get versionHint => 'उदा. 1.0.0';
	@override String saveSuccess({required Object name}) => 'प्रोफ़ाइल \'${name}\' सहेजी गई';
	@override String deleteConfirm({required Object name}) => 'प्रोफ़ाइल \'${name}\' हटाएं?';
	@override String get deleteSuccess => 'प्रोफ़ाइल हटाई गई';
	@override String applied({required Object name}) => 'प्रोफ़ाइल \'${name}\' लागू की गई';
	@override String get updateExisting => 'मौजूदा अपडेट करें';
	@override String get saveAsNew => 'नए के रूप में सहेजें';
	@override String overwriteConfirm({required Object name}) => 'प्रोफ़ाइल \'${name}\' पहले से मौजूद है। ओवरराइट करें?';
}

// Path: build
class _TranslationsBuildHi extends TranslationsBuildEn {
	_TranslationsBuildHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get button => 'बिल्ड';
	@override String get building => 'बिल्ड हो रहा है...';
	@override String buildingPlatform({required Object platform, required Object completed, required Object total}) => '${platform} बिल्ड हो रहा है... (${completed}/${total})';
	@override String get cancel => 'रद्द करें';
}

// Path: buildLog
class _TranslationsBuildLogHi extends TranslationsBuildLogEn {
	_TranslationsBuildLogHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'बिल्ड आउटपुट';
	@override String get copyTooltip => 'लॉग कॉपी करें';
	@override String get copied => 'लॉग क्लिपबोर्ड पर कॉपी किए गए';
	@override String get placeholder => 'बिल्ड आउटपुट यहां दिखाई देगा...';
}

// Path: buildStatus
class _TranslationsBuildStatusHi extends TranslationsBuildStatusEn {
	_TranslationsBuildStatusHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get idle => 'निष्क्रिय';
	@override String get running => 'चल रहा है';
	@override String get success => 'सफल';
	@override String get failed => 'विफल';
}

// Path: platforms
class _TranslationsPlatformsHi extends TranslationsPlatformsEn {
	_TranslationsPlatformsHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get android => 'Android';
	@override String get ios => 'iOS';
	@override String get web => 'Web';
}

// Path: platformConfig
class _TranslationsPlatformConfigHi extends TranslationsPlatformConfigEn {
	_TranslationsPlatformConfigHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get outputType => 'आउटपुट प्रकार';
	@override String get codeObfuscation => 'कोड ऑब्फ़स्केशन';
	@override String get splitDebugInfo => 'Split Debug Info';
	@override String get flavor => 'Flavor';
	@override String get flavorHint => 'उदा. dev, staging, prod';
	@override String get runMode => 'रन मोड';
	@override String get target => 'लक्ष्य';
	@override String get targetHint => 'lib/main.dart';
	@override String get pwaStrategy => 'PWA रणनीति';
	@override String get noTreeShakeIcons => 'No Tree Shake Icons';
}

// Path: androidOutput
class _TranslationsAndroidOutputHi extends TranslationsAndroidOutputEn {
	_TranslationsAndroidOutputHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get apk => 'केवल APK';
	@override String get aab => 'केवल AAB';
	@override String get both => 'APK और AAB';
}

// Path: iosOutput
class _TranslationsIosOutputHi extends TranslationsIosOutputEn {
	_TranslationsIosOutputHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get ios => 'iOS (Runner.app)';
	@override String get ipa => 'IPA (निर्यात योग्य)';
}

// Path: buildMode
class _TranslationsBuildModeHi extends TranslationsBuildModeEn {
	_TranslationsBuildModeHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get debug => 'Debug';
	@override String get profile => 'Profile';
	@override String get release => 'Release';
}

// Path: pwaStrategy
class _TranslationsPwaStrategyHi extends TranslationsPwaStrategyEn {
	_TranslationsPwaStrategyHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get kDefault => 'डिफ़ॉल्ट';
	@override String get none => 'कोई नहीं';
}

// Path: language
class _TranslationsLanguageHi extends TranslationsLanguageEn {
	_TranslationsLanguageHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'भाषा';
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
class _TranslationsThemeHi extends TranslationsThemeEn {
	_TranslationsThemeHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'थीम';
	@override String get dark => 'डार्क';
	@override String get light => 'लाइट';
}

/// The flat map containing all translations for locale <hi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'BuildPaw',
			'common.cancel' => 'रद्द करें',
			'common.export' => 'निर्यात',
			'common.browse' => 'ब्राउज़',
			'common.save' => 'सहेजें',
			'common.delete' => 'हटाएं',
			'projectSelector.title' => 'BuildPaw',
			'projectSelector.hint' => 'Flutter प्रोजेक्ट डायरेक्टरी चुनें...',
			'projectSelector.selectDialogTitle' => 'Flutter प्रोजेक्ट चुनें',
			'projectInfo.title' => 'प्रोजेक्ट जानकारी',
			'projectInfo.generalTab' => 'सामान्य',
			'projectInfo.dependenciesTab' => 'डिपेंडेंसी',
			'projectInfo.refreshTooltip' => 'प्रोजेक्ट जानकारी रीफ्रेश करें',
			'projectInfo.fvmActive' => 'FVM सक्रिय',
			'projectInfo.fvmInactive' => 'FVM नहीं',
			'projectInfo.noDependencies' => 'कोई डिपेंडेंसी नहीं मिली',
			'projectInfo.package' => 'पैकेज',
			'projectInfo.version' => 'संस्करण',
			'config.export' => 'कॉन्फ़िग निर्यात करें',
			'config.import' => 'कॉन्फ़िग आयात करें',
			'config.exportSuccess' => ({required Object path}) => 'कॉन्फ़िग ${path} पर निर्यात किया गया',
			'config.exportCancelled' => 'निर्यात रद्द किया गया।',
			'config.importSuccess' => ({required Object name}) => 'आयातित: ${name}',
			'config.importCancelled' => 'आयात रद्द किया गया या फ़ाइल अमान्य।',
			'config.dropToImport' => 'कॉन्फ़िग आयात करने के लिए JSON फ़ाइल छोड़ें',
			'exportDialog.title' => 'बिल्ड कॉन्फ़िग निर्यात करें',
			'exportDialog.presetName' => 'प्रीसेट नाम',
			'exportDialog.presetNameHint' => 'उदा. release-prod',
			'exportDialog.version' => 'संस्करण',
			'exportDialog.versionHint' => 'उदा. 1.0.0',
			'profile.title' => 'प्रोफ़ाइल',
			'profile.noProfiles' => 'कोई सहेजी गई प्रोफ़ाइल नहीं',
			'profile.saveProfile' => 'प्रोफ़ाइल सहेजें',
			'profile.newProfile' => 'नई प्रोफ़ाइल',
			'profile.profileName' => 'प्रोफ़ाइल नाम',
			'profile.profileNameHint' => 'उदा. release-prod',
			'profile.version' => 'संस्करण',
			'profile.versionHint' => 'उदा. 1.0.0',
			'profile.saveSuccess' => ({required Object name}) => 'प्रोफ़ाइल \'${name}\' सहेजी गई',
			'profile.deleteConfirm' => ({required Object name}) => 'प्रोफ़ाइल \'${name}\' हटाएं?',
			'profile.deleteSuccess' => 'प्रोफ़ाइल हटाई गई',
			'profile.applied' => ({required Object name}) => 'प्रोफ़ाइल \'${name}\' लागू की गई',
			'profile.updateExisting' => 'मौजूदा अपडेट करें',
			'profile.saveAsNew' => 'नए के रूप में सहेजें',
			'profile.overwriteConfirm' => ({required Object name}) => 'प्रोफ़ाइल \'${name}\' पहले से मौजूद है। ओवरराइट करें?',
			'build.button' => 'बिल्ड',
			'build.building' => 'बिल्ड हो रहा है...',
			'build.buildingPlatform' => ({required Object platform, required Object completed, required Object total}) => '${platform} बिल्ड हो रहा है... (${completed}/${total})',
			'build.cancel' => 'रद्द करें',
			'buildLog.title' => 'बिल्ड आउटपुट',
			'buildLog.copyTooltip' => 'लॉग कॉपी करें',
			'buildLog.copied' => 'लॉग क्लिपबोर्ड पर कॉपी किए गए',
			'buildLog.placeholder' => 'बिल्ड आउटपुट यहां दिखाई देगा...',
			'buildStatus.idle' => 'निष्क्रिय',
			'buildStatus.running' => 'चल रहा है',
			'buildStatus.success' => 'सफल',
			'buildStatus.failed' => 'विफल',
			'platforms.android' => 'Android',
			'platforms.ios' => 'iOS',
			'platforms.web' => 'Web',
			'platformConfig.outputType' => 'आउटपुट प्रकार',
			'platformConfig.codeObfuscation' => 'कोड ऑब्फ़स्केशन',
			'platformConfig.splitDebugInfo' => 'Split Debug Info',
			'platformConfig.flavor' => 'Flavor',
			'platformConfig.flavorHint' => 'उदा. dev, staging, prod',
			'platformConfig.runMode' => 'रन मोड',
			'platformConfig.target' => 'लक्ष्य',
			'platformConfig.targetHint' => 'lib/main.dart',
			'platformConfig.pwaStrategy' => 'PWA रणनीति',
			'platformConfig.noTreeShakeIcons' => 'No Tree Shake Icons',
			'androidOutput.apk' => 'केवल APK',
			'androidOutput.aab' => 'केवल AAB',
			'androidOutput.both' => 'APK और AAB',
			'iosOutput.ios' => 'iOS (Runner.app)',
			'iosOutput.ipa' => 'IPA (निर्यात योग्य)',
			'buildMode.debug' => 'Debug',
			'buildMode.profile' => 'Profile',
			'buildMode.release' => 'Release',
			'pwaStrategy.kDefault' => 'डिफ़ॉल्ट',
			'pwaStrategy.none' => 'कोई नहीं',
			'language.title' => 'भाषा',
			'language.english' => 'English',
			'language.turkish' => 'Türkçe',
			'language.arabic' => 'العربية',
			'language.german' => 'Deutsch',
			'language.french' => 'Français',
			'language.chinese' => '简体中文',
			'language.russian' => 'Русский',
			'language.hindi' => 'हिन्दी',
			'theme.title' => 'थीम',
			'theme.dark' => 'डार्क',
			'theme.light' => 'लाइट',
			_ => null,
		};
	}
}
