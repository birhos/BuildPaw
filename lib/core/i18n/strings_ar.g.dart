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
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppAr app = _TranslationsAppAr._(_root);
	@override late final _TranslationsCommonAr common = _TranslationsCommonAr._(_root);
	@override late final _TranslationsProjectSelectorAr projectSelector = _TranslationsProjectSelectorAr._(_root);
	@override late final _TranslationsProjectInfoAr projectInfo = _TranslationsProjectInfoAr._(_root);
	@override late final _TranslationsConfigAr config = _TranslationsConfigAr._(_root);
	@override late final _TranslationsExportDialogAr exportDialog = _TranslationsExportDialogAr._(_root);
	@override late final _TranslationsProfileAr profile = _TranslationsProfileAr._(_root);
	@override late final _TranslationsBuildAr build = _TranslationsBuildAr._(_root);
	@override late final _TranslationsBuildLogAr buildLog = _TranslationsBuildLogAr._(_root);
	@override late final _TranslationsBuildStatusAr buildStatus = _TranslationsBuildStatusAr._(_root);
	@override late final _TranslationsPlatformsAr platforms = _TranslationsPlatformsAr._(_root);
	@override late final _TranslationsPlatformConfigAr platformConfig = _TranslationsPlatformConfigAr._(_root);
	@override late final _TranslationsAndroidOutputAr androidOutput = _TranslationsAndroidOutputAr._(_root);
	@override late final _TranslationsIosOutputAr iosOutput = _TranslationsIosOutputAr._(_root);
	@override late final _TranslationsBuildModeAr buildMode = _TranslationsBuildModeAr._(_root);
	@override late final _TranslationsPwaStrategyAr pwaStrategy = _TranslationsPwaStrategyAr._(_root);
	@override late final _TranslationsLanguageAr language = _TranslationsLanguageAr._(_root);
	@override late final _TranslationsThemeAr theme = _TranslationsThemeAr._(_root);
}

// Path: app
class _TranslationsAppAr extends TranslationsAppEn {
	_TranslationsAppAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get name => 'BuildPaw';
}

// Path: common
class _TranslationsCommonAr extends TranslationsCommonEn {
	_TranslationsCommonAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'إلغاء';
	@override String get export => 'تصدير';
	@override String get browse => 'تصفح';
	@override String get save => 'حفظ';
	@override String get delete => 'حذف';
}

// Path: projectSelector
class _TranslationsProjectSelectorAr extends TranslationsProjectSelectorEn {
	_TranslationsProjectSelectorAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'BuildPaw';
	@override String get hint => 'اختر مجلد مشروع Flutter...';
	@override String get selectDialogTitle => 'اختيار مشروع Flutter';
}

// Path: projectInfo
class _TranslationsProjectInfoAr extends TranslationsProjectInfoEn {
	_TranslationsProjectInfoAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'معلومات المشروع';
	@override String get generalTab => 'عام';
	@override String get dependenciesTab => 'التبعيات';
	@override String get refreshTooltip => 'تحديث معلومات المشروع';
	@override String get fvmActive => 'FVM مفعّل';
	@override String get fvmInactive => 'بدون FVM';
	@override String get noDependencies => 'لم يتم العثور على تبعيات';
	@override String get package => 'الحزمة';
	@override String get version => 'الإصدار';
}

// Path: config
class _TranslationsConfigAr extends TranslationsConfigEn {
	_TranslationsConfigAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get export => 'تصدير الإعدادات';
	@override String get import => 'استيراد الإعدادات';
	@override String exportSuccess({required Object path}) => 'تم تصدير الإعدادات إلى ${path}';
	@override String get exportCancelled => 'تم إلغاء التصدير.';
	@override String importSuccess({required Object name}) => 'تم الاستيراد: ${name}';
	@override String get importCancelled => 'تم إلغاء الاستيراد أو الملف غير صالح.';
	@override String get dropToImport => 'أسقط ملف JSON لاستيراد الإعدادات';
}

// Path: exportDialog
class _TranslationsExportDialogAr extends TranslationsExportDialogEn {
	_TranslationsExportDialogAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تصدير إعدادات البناء';
	@override String get presetName => 'اسم الإعداد';
	@override String get presetNameHint => 'مثال: release-prod';
	@override String get version => 'الإصدار';
	@override String get versionHint => 'مثال: 1.0.0';
}

// Path: profile
class _TranslationsProfileAr extends TranslationsProfileEn {
	_TranslationsProfileAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الملفات الشخصية';
	@override String get noProfiles => 'لا توجد ملفات شخصية محفوظة';
	@override String get saveProfile => 'حفظ الملف الشخصي';
	@override String get newProfile => 'ملف شخصي جديد';
	@override String get profileName => 'اسم الملف الشخصي';
	@override String get profileNameHint => 'مثال: release-prod';
	@override String get version => 'الإصدار';
	@override String get versionHint => 'مثال: 1.0.0';
	@override String saveSuccess({required Object name}) => 'تم حفظ الملف الشخصي \'${name}\'';
	@override String deleteConfirm({required Object name}) => 'حذف الملف الشخصي \'${name}\'؟';
	@override String get deleteSuccess => 'تم حذف الملف الشخصي';
	@override String applied({required Object name}) => 'تم تطبيق الملف الشخصي \'${name}\'';
	@override String get updateExisting => 'تحديث الحالي';
	@override String get saveAsNew => 'حفظ كجديد';
	@override String overwriteConfirm({required Object name}) => 'الملف الشخصي \'${name}\' موجود بالفعل. هل تريد الكتابة فوقه؟';
}

// Path: build
class _TranslationsBuildAr extends TranslationsBuildEn {
	_TranslationsBuildAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get button => 'بناء';
	@override String get building => 'جارٍ البناء...';
	@override String buildingPlatform({required Object platform, required Object completed, required Object total}) => 'جارٍ بناء ${platform}... (${completed}/${total})';
	@override String get cancel => 'إلغاء';
}

// Path: buildLog
class _TranslationsBuildLogAr extends TranslationsBuildLogEn {
	_TranslationsBuildLogAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مخرجات البناء';
	@override String get copyTooltip => 'نسخ السجلات';
	@override String get copied => 'تم نسخ السجلات';
	@override String get placeholder => 'ستظهر مخرجات البناء هنا...';
}

// Path: buildStatus
class _TranslationsBuildStatusAr extends TranslationsBuildStatusEn {
	_TranslationsBuildStatusAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get idle => 'خامل';
	@override String get running => 'قيد التشغيل';
	@override String get success => 'نجاح';
	@override String get failed => 'فشل';
}

// Path: platforms
class _TranslationsPlatformsAr extends TranslationsPlatformsEn {
	_TranslationsPlatformsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get android => 'Android';
	@override String get ios => 'iOS';
	@override String get web => 'Web';
}

// Path: platformConfig
class _TranslationsPlatformConfigAr extends TranslationsPlatformConfigEn {
	_TranslationsPlatformConfigAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get outputType => 'نوع المخرجات';
	@override String get codeObfuscation => 'تشويش الكود';
	@override String get splitDebugInfo => 'Split Debug Info';
	@override String get flavor => 'Flavor';
	@override String get flavorHint => 'مثال: dev, staging, prod';
	@override String get runMode => 'وضع التشغيل';
	@override String get target => 'الهدف';
	@override String get targetHint => 'lib/main.dart';
	@override String get pwaStrategy => 'استراتيجية PWA';
	@override String get noTreeShakeIcons => 'No Tree Shake Icons';
}

// Path: androidOutput
class _TranslationsAndroidOutputAr extends TranslationsAndroidOutputEn {
	_TranslationsAndroidOutputAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get apk => 'APK فقط';
	@override String get aab => 'AAB فقط';
	@override String get both => 'APK و AAB';
}

// Path: iosOutput
class _TranslationsIosOutputAr extends TranslationsIosOutputEn {
	_TranslationsIosOutputAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get ios => 'iOS (Runner.app)';
	@override String get ipa => 'IPA (قابل للتصدير)';
}

// Path: buildMode
class _TranslationsBuildModeAr extends TranslationsBuildModeEn {
	_TranslationsBuildModeAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get debug => 'Debug';
	@override String get profile => 'Profile';
	@override String get release => 'Release';
}

// Path: pwaStrategy
class _TranslationsPwaStrategyAr extends TranslationsPwaStrategyEn {
	_TranslationsPwaStrategyAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get kDefault => 'افتراضي';
	@override String get none => 'بدون';
}

// Path: language
class _TranslationsLanguageAr extends TranslationsLanguageEn {
	_TranslationsLanguageAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اللغة';
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
class _TranslationsThemeAr extends TranslationsThemeEn {
	_TranslationsThemeAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'المظهر';
	@override String get dark => 'داكن';
	@override String get light => 'فاتح';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'BuildPaw',
			'common.cancel' => 'إلغاء',
			'common.export' => 'تصدير',
			'common.browse' => 'تصفح',
			'common.save' => 'حفظ',
			'common.delete' => 'حذف',
			'projectSelector.title' => 'BuildPaw',
			'projectSelector.hint' => 'اختر مجلد مشروع Flutter...',
			'projectSelector.selectDialogTitle' => 'اختيار مشروع Flutter',
			'projectInfo.title' => 'معلومات المشروع',
			'projectInfo.generalTab' => 'عام',
			'projectInfo.dependenciesTab' => 'التبعيات',
			'projectInfo.refreshTooltip' => 'تحديث معلومات المشروع',
			'projectInfo.fvmActive' => 'FVM مفعّل',
			'projectInfo.fvmInactive' => 'بدون FVM',
			'projectInfo.noDependencies' => 'لم يتم العثور على تبعيات',
			'projectInfo.package' => 'الحزمة',
			'projectInfo.version' => 'الإصدار',
			'config.export' => 'تصدير الإعدادات',
			'config.import' => 'استيراد الإعدادات',
			'config.exportSuccess' => ({required Object path}) => 'تم تصدير الإعدادات إلى ${path}',
			'config.exportCancelled' => 'تم إلغاء التصدير.',
			'config.importSuccess' => ({required Object name}) => 'تم الاستيراد: ${name}',
			'config.importCancelled' => 'تم إلغاء الاستيراد أو الملف غير صالح.',
			'config.dropToImport' => 'أسقط ملف JSON لاستيراد الإعدادات',
			'exportDialog.title' => 'تصدير إعدادات البناء',
			'exportDialog.presetName' => 'اسم الإعداد',
			'exportDialog.presetNameHint' => 'مثال: release-prod',
			'exportDialog.version' => 'الإصدار',
			'exportDialog.versionHint' => 'مثال: 1.0.0',
			'profile.title' => 'الملفات الشخصية',
			'profile.noProfiles' => 'لا توجد ملفات شخصية محفوظة',
			'profile.saveProfile' => 'حفظ الملف الشخصي',
			'profile.newProfile' => 'ملف شخصي جديد',
			'profile.profileName' => 'اسم الملف الشخصي',
			'profile.profileNameHint' => 'مثال: release-prod',
			'profile.version' => 'الإصدار',
			'profile.versionHint' => 'مثال: 1.0.0',
			'profile.saveSuccess' => ({required Object name}) => 'تم حفظ الملف الشخصي \'${name}\'',
			'profile.deleteConfirm' => ({required Object name}) => 'حذف الملف الشخصي \'${name}\'؟',
			'profile.deleteSuccess' => 'تم حذف الملف الشخصي',
			'profile.applied' => ({required Object name}) => 'تم تطبيق الملف الشخصي \'${name}\'',
			'profile.updateExisting' => 'تحديث الحالي',
			'profile.saveAsNew' => 'حفظ كجديد',
			'profile.overwriteConfirm' => ({required Object name}) => 'الملف الشخصي \'${name}\' موجود بالفعل. هل تريد الكتابة فوقه؟',
			'build.button' => 'بناء',
			'build.building' => 'جارٍ البناء...',
			'build.buildingPlatform' => ({required Object platform, required Object completed, required Object total}) => 'جارٍ بناء ${platform}... (${completed}/${total})',
			'build.cancel' => 'إلغاء',
			'buildLog.title' => 'مخرجات البناء',
			'buildLog.copyTooltip' => 'نسخ السجلات',
			'buildLog.copied' => 'تم نسخ السجلات',
			'buildLog.placeholder' => 'ستظهر مخرجات البناء هنا...',
			'buildStatus.idle' => 'خامل',
			'buildStatus.running' => 'قيد التشغيل',
			'buildStatus.success' => 'نجاح',
			'buildStatus.failed' => 'فشل',
			'platforms.android' => 'Android',
			'platforms.ios' => 'iOS',
			'platforms.web' => 'Web',
			'platformConfig.outputType' => 'نوع المخرجات',
			'platformConfig.codeObfuscation' => 'تشويش الكود',
			'platformConfig.splitDebugInfo' => 'Split Debug Info',
			'platformConfig.flavor' => 'Flavor',
			'platformConfig.flavorHint' => 'مثال: dev, staging, prod',
			'platformConfig.runMode' => 'وضع التشغيل',
			'platformConfig.target' => 'الهدف',
			'platformConfig.targetHint' => 'lib/main.dart',
			'platformConfig.pwaStrategy' => 'استراتيجية PWA',
			'platformConfig.noTreeShakeIcons' => 'No Tree Shake Icons',
			'androidOutput.apk' => 'APK فقط',
			'androidOutput.aab' => 'AAB فقط',
			'androidOutput.both' => 'APK و AAB',
			'iosOutput.ios' => 'iOS (Runner.app)',
			'iosOutput.ipa' => 'IPA (قابل للتصدير)',
			'buildMode.debug' => 'Debug',
			'buildMode.profile' => 'Profile',
			'buildMode.release' => 'Release',
			'pwaStrategy.kDefault' => 'افتراضي',
			'pwaStrategy.none' => 'بدون',
			'language.title' => 'اللغة',
			'language.english' => 'English',
			'language.turkish' => 'Türkçe',
			'language.arabic' => 'العربية',
			'language.german' => 'Deutsch',
			'language.french' => 'Français',
			'language.chinese' => '简体中文',
			'language.russian' => 'Русский',
			'language.hindi' => 'हिन्दी',
			'theme.title' => 'المظهر',
			'theme.dark' => 'داكن',
			'theme.light' => 'فاتح',
			_ => null,
		};
	}
}
