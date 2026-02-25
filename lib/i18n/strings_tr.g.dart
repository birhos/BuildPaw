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
class TranslationsTr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsTr _root = this; // ignore: unused_field

	@override 
	TranslationsTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppTr app = _TranslationsAppTr._(_root);
	@override late final _TranslationsCommonTr common = _TranslationsCommonTr._(_root);
	@override late final _TranslationsProjectSelectorTr projectSelector = _TranslationsProjectSelectorTr._(_root);
	@override late final _TranslationsProjectInfoTr projectInfo = _TranslationsProjectInfoTr._(_root);
	@override late final _TranslationsConfigTr config = _TranslationsConfigTr._(_root);
	@override late final _TranslationsExportDialogTr exportDialog = _TranslationsExportDialogTr._(_root);
	@override late final _TranslationsBuildTr build = _TranslationsBuildTr._(_root);
	@override late final _TranslationsBuildLogTr buildLog = _TranslationsBuildLogTr._(_root);
	@override late final _TranslationsBuildStatusTr buildStatus = _TranslationsBuildStatusTr._(_root);
	@override late final _TranslationsPlatformsTr platforms = _TranslationsPlatformsTr._(_root);
	@override late final _TranslationsPlatformConfigTr platformConfig = _TranslationsPlatformConfigTr._(_root);
	@override late final _TranslationsAndroidOutputTr androidOutput = _TranslationsAndroidOutputTr._(_root);
	@override late final _TranslationsIosOutputTr iosOutput = _TranslationsIosOutputTr._(_root);
	@override late final _TranslationsBuildModeTr buildMode = _TranslationsBuildModeTr._(_root);
	@override late final _TranslationsPwaStrategyTr pwaStrategy = _TranslationsPwaStrategyTr._(_root);
	@override late final _TranslationsLanguageTr language = _TranslationsLanguageTr._(_root);
	@override late final _TranslationsThemeTr theme = _TranslationsThemeTr._(_root);
}

// Path: app
class _TranslationsAppTr extends TranslationsAppEn {
	_TranslationsAppTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get name => 'BuildPaw';
}

// Path: common
class _TranslationsCommonTr extends TranslationsCommonEn {
	_TranslationsCommonTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'İptal';
	@override String get export => 'Dışa Aktar';
	@override String get browse => 'Gözat';
}

// Path: projectSelector
class _TranslationsProjectSelectorTr extends TranslationsProjectSelectorEn {
	_TranslationsProjectSelectorTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'BuildPaw';
	@override String get hint => 'Bir Flutter proje dizini seçin...';
	@override String get selectDialogTitle => 'Flutter Projesi Seç';
}

// Path: projectInfo
class _TranslationsProjectInfoTr extends TranslationsProjectInfoEn {
	_TranslationsProjectInfoTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Proje Bilgisi';
	@override String get refreshTooltip => 'Proje bilgisini yenile';
	@override String get fvmActive => 'FVM Aktif';
	@override String get fvmInactive => 'FVM Yok';
}

// Path: config
class _TranslationsConfigTr extends TranslationsConfigEn {
	_TranslationsConfigTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get export => 'Yapılandırmayı Dışa Aktar';
	@override String get import => 'Yapılandırmayı İçe Aktar';
	@override String exportSuccess({required Object path}) => 'Yapılandırma ${path} konumuna aktarıldı';
	@override String get exportCancelled => 'Dışa aktarma iptal edildi.';
	@override String importSuccess({required Object name}) => 'İçe aktarıldı: ${name}';
	@override String get importCancelled => 'İçe aktarma iptal edildi veya dosya geçersiz.';
}

// Path: exportDialog
class _TranslationsExportDialogTr extends TranslationsExportDialogEn {
	_TranslationsExportDialogTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yapılandırmayı Dışa Aktar';
	@override String get presetName => 'Önayar Adı';
	@override String get presetNameHint => 'örn. release-prod';
	@override String get version => 'Sürüm';
	@override String get versionHint => 'örn. 1.0.0';
}

// Path: build
class _TranslationsBuildTr extends TranslationsBuildEn {
	_TranslationsBuildTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get button => 'DERLE';
	@override String get building => 'Derleniyor...';
	@override String buildingPlatform({required Object platform, required Object completed, required Object total}) => '${platform} derleniyor... (${completed}/${total})';
	@override String get cancel => 'İptal';
}

// Path: buildLog
class _TranslationsBuildLogTr extends TranslationsBuildLogEn {
	_TranslationsBuildLogTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Derleme Çıktısı';
	@override String get copyTooltip => 'Günlükleri kopyala';
	@override String get copied => 'Günlükler panoya kopyalandı';
	@override String get placeholder => 'Derleme çıktısı burada görünecek...';
}

// Path: buildStatus
class _TranslationsBuildStatusTr extends TranslationsBuildStatusEn {
	_TranslationsBuildStatusTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get idle => 'Beklemede';
	@override String get running => 'Çalışıyor';
	@override String get success => 'Başarılı';
	@override String get failed => 'Başarısız';
}

// Path: platforms
class _TranslationsPlatformsTr extends TranslationsPlatformsEn {
	_TranslationsPlatformsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get android => 'Android';
	@override String get ios => 'iOS';
	@override String get web => 'Web';
}

// Path: platformConfig
class _TranslationsPlatformConfigTr extends TranslationsPlatformConfigEn {
	_TranslationsPlatformConfigTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get outputType => 'Çıktı Türü';
	@override String get codeObfuscation => 'Kod Gizleme';
	@override String get splitDebugInfo => 'Split Debug Info';
	@override String get flavor => 'Flavor';
	@override String get flavorHint => 'örn. dev, staging, prod';
	@override String get runMode => 'Çalışma Modu';
	@override String get target => 'Hedef';
	@override String get targetHint => 'lib/main.dart';
	@override String get pwaStrategy => 'PWA Stratejisi';
	@override String get noTreeShakeIcons => 'No Tree Shake Icons';
}

// Path: androidOutput
class _TranslationsAndroidOutputTr extends TranslationsAndroidOutputEn {
	_TranslationsAndroidOutputTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get apk => 'Sadece APK';
	@override String get aab => 'Sadece AAB';
	@override String get both => 'APK ve AAB';
}

// Path: iosOutput
class _TranslationsIosOutputTr extends TranslationsIosOutputEn {
	_TranslationsIosOutputTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get ios => 'iOS (Runner.app)';
	@override String get ipa => 'IPA (Dışa Aktarılabilir)';
}

// Path: buildMode
class _TranslationsBuildModeTr extends TranslationsBuildModeEn {
	_TranslationsBuildModeTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get debug => 'Debug';
	@override String get profile => 'Profile';
	@override String get release => 'Release';
}

// Path: pwaStrategy
class _TranslationsPwaStrategyTr extends TranslationsPwaStrategyEn {
	_TranslationsPwaStrategyTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get kDefault => 'Varsayılan';
	@override String get none => 'Yok';
}

// Path: language
class _TranslationsLanguageTr extends TranslationsLanguageEn {
	_TranslationsLanguageTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dil';
	@override String get english => 'English';
	@override String get turkish => 'Türkçe';
}

// Path: theme
class _TranslationsThemeTr extends TranslationsThemeEn {
	_TranslationsThemeTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tema';
	@override String get dark => 'Koyu';
	@override String get light => 'Açık';
}

/// The flat map containing all translations for locale <tr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'BuildPaw',
			'common.cancel' => 'İptal',
			'common.export' => 'Dışa Aktar',
			'common.browse' => 'Gözat',
			'projectSelector.title' => 'BuildPaw',
			'projectSelector.hint' => 'Bir Flutter proje dizini seçin...',
			'projectSelector.selectDialogTitle' => 'Flutter Projesi Seç',
			'projectInfo.title' => 'Proje Bilgisi',
			'projectInfo.refreshTooltip' => 'Proje bilgisini yenile',
			'projectInfo.fvmActive' => 'FVM Aktif',
			'projectInfo.fvmInactive' => 'FVM Yok',
			'config.export' => 'Yapılandırmayı Dışa Aktar',
			'config.import' => 'Yapılandırmayı İçe Aktar',
			'config.exportSuccess' => ({required Object path}) => 'Yapılandırma ${path} konumuna aktarıldı',
			'config.exportCancelled' => 'Dışa aktarma iptal edildi.',
			'config.importSuccess' => ({required Object name}) => 'İçe aktarıldı: ${name}',
			'config.importCancelled' => 'İçe aktarma iptal edildi veya dosya geçersiz.',
			'exportDialog.title' => 'Yapılandırmayı Dışa Aktar',
			'exportDialog.presetName' => 'Önayar Adı',
			'exportDialog.presetNameHint' => 'örn. release-prod',
			'exportDialog.version' => 'Sürüm',
			'exportDialog.versionHint' => 'örn. 1.0.0',
			'build.button' => 'DERLE',
			'build.building' => 'Derleniyor...',
			'build.buildingPlatform' => ({required Object platform, required Object completed, required Object total}) => '${platform} derleniyor... (${completed}/${total})',
			'build.cancel' => 'İptal',
			'buildLog.title' => 'Derleme Çıktısı',
			'buildLog.copyTooltip' => 'Günlükleri kopyala',
			'buildLog.copied' => 'Günlükler panoya kopyalandı',
			'buildLog.placeholder' => 'Derleme çıktısı burada görünecek...',
			'buildStatus.idle' => 'Beklemede',
			'buildStatus.running' => 'Çalışıyor',
			'buildStatus.success' => 'Başarılı',
			'buildStatus.failed' => 'Başarısız',
			'platforms.android' => 'Android',
			'platforms.ios' => 'iOS',
			'platforms.web' => 'Web',
			'platformConfig.outputType' => 'Çıktı Türü',
			'platformConfig.codeObfuscation' => 'Kod Gizleme',
			'platformConfig.splitDebugInfo' => 'Split Debug Info',
			'platformConfig.flavor' => 'Flavor',
			'platformConfig.flavorHint' => 'örn. dev, staging, prod',
			'platformConfig.runMode' => 'Çalışma Modu',
			'platformConfig.target' => 'Hedef',
			'platformConfig.targetHint' => 'lib/main.dart',
			'platformConfig.pwaStrategy' => 'PWA Stratejisi',
			'platformConfig.noTreeShakeIcons' => 'No Tree Shake Icons',
			'androidOutput.apk' => 'Sadece APK',
			'androidOutput.aab' => 'Sadece AAB',
			'androidOutput.both' => 'APK ve AAB',
			'iosOutput.ios' => 'iOS (Runner.app)',
			'iosOutput.ipa' => 'IPA (Dışa Aktarılabilir)',
			'buildMode.debug' => 'Debug',
			'buildMode.profile' => 'Profile',
			'buildMode.release' => 'Release',
			'pwaStrategy.kDefault' => 'Varsayılan',
			'pwaStrategy.none' => 'Yok',
			'language.title' => 'Dil',
			'language.english' => 'English',
			'language.turkish' => 'Türkçe',
			'theme.title' => 'Tema',
			'theme.dark' => 'Koyu',
			'theme.light' => 'Açık',
			_ => null,
		};
	}
}
