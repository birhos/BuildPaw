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
	@override late final _TranslationsPublishAr publish = _TranslationsPublishAr._(_root);
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

// Path: publish
class _TranslationsPublishAr extends TranslationsPublishEn {
	_TranslationsPublishAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get tab => 'نشر';
	@override String get button => 'نشر';
	@override String get target => 'الهدف';
	@override String get profile => 'الملف الشخصي';
	@override String get releaseNotes => 'ملاحظات الإصدار';
	@override String get releaseNotesHint => 'ملاحظات إصدار اختيارية...';
	@override String get testerGroup => 'مجموعة المختبرين';
	@override String get testerGroupHint => 'مثال: testers';
	@override String get track => 'المسار';
	@override String get noProfile => 'لم يتم اختيار ملف شخصي';
	@override String get noProject => 'اختر مشروعاً أولاً';
	@override String get noBuildOutput => 'قم بعملية بناء أولاً لنشر المخرجات';
	@override String get lastBuild => 'آخر بناء';
	@override String get configureNow => 'تكوين الآن';
	@override String get fastlaneMissing => 'Fastlane غير موجود';
	@override String get fastlaneMissingMessage => 'Fastlane مطلوب للنشر. تريد تثبيته؟';
	@override String get install => 'تثبيت';
	@override String get configMissing => 'إعداد Fastlane غير موجود';
	@override String get configMissingMessage => 'إعداد Fastlane (Fastfile, Appfile) مطلوب للنشر.';
	@override String get retry => 'إعادة المحاولة';
	@override String get stop => 'إيقاف';
	@override String get publishLogTitle => 'مخرجات النشر';
	@override String get firebase => 'Firebase App Distribution';
	@override String get googlePlay => 'Google Play Console';
	@override String get appStoreConnect => 'App Store Connect (TestFlight)';
	@override String get internal => 'داخلي';
	@override String get closed => 'مغلق';
	@override String get production => 'إنتاج';
	@override String get publishProfiles => 'ملفات النشر الشخصية';
	@override String get configureProfile => 'تكوين الملف الشخصي';
	@override String get newPublishProfile => 'ملف نشر شخصي جديد';
	@override String get firebaseAppId => 'معرف تطبيق Firebase';
	@override String get firebaseAppIdHint => '1:123:android:abc';
	@override String get firebaseToken => 'رمز Firebase (يُخزّن بأمان)';
	@override String get playPackageName => 'اسم الحزمة';
	@override String get playPackageNameHint => 'com.example.app';
	@override String get playServiceAccount => 'مسار JSON لحساب الخدمة';
	@override String get ascBundleId => 'معرف الحزمة';
	@override String get ascBundleIdHint => 'com.example.app';
	@override String get ascAppleId => 'Apple ID (البريد الإلكتروني)';
	@override String get ascAppleIdHint => 'developer@example.com';
	@override String get ascTeamId => 'معرف الفريق (Developer Portal)';
	@override String get ascItcTeamId => 'معرف فريق ITC (App Store Connect)';
	@override String get ascApplePassword => 'كلمة مرور التطبيق (يُخزّن بأمان)';
	@override String get ascApiKeyId => 'معرف مفتاح API';
	@override String get ascIssuerId => 'معرف المُصدر';
	@override String get ascApiKeyPath => 'مسار مفتاح API (.p8)';
	@override String get ascAppleIdAuth => 'مصادقة Apple ID';
	@override String get ascApiKeyAuth => 'مصادقة مفتاح API (بديل)';
	@override String get notificationSuccessTitle => '✅ تم النشر بنجاح!';
	@override String get notificationSuccessBody => 'تم توزيع البناء الخاص بك.';
	@override String notificationSuccessSubtitle({required Object platform, required Object track}) => 'المنصة: ${platform} • المسار: ${track}';
	@override String notificationSuccessSubtitlePlatform({required Object platform}) => 'المنصة: ${platform}';
	@override String get notificationErrorTitle => '❌ فشل النشر';
	@override String get notificationErrorSubtitle => 'BuildPaw';
	@override String get notificationErrorBody => 'تحقق من السجلات للتفاصيل.';
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
			'publish.tab' => 'نشر',
			'publish.button' => 'نشر',
			'publish.target' => 'الهدف',
			'publish.profile' => 'الملف الشخصي',
			'publish.releaseNotes' => 'ملاحظات الإصدار',
			'publish.releaseNotesHint' => 'ملاحظات إصدار اختيارية...',
			'publish.testerGroup' => 'مجموعة المختبرين',
			'publish.testerGroupHint' => 'مثال: testers',
			'publish.track' => 'المسار',
			'publish.noProfile' => 'لم يتم اختيار ملف شخصي',
			'publish.noProject' => 'اختر مشروعاً أولاً',
			'publish.noBuildOutput' => 'قم بعملية بناء أولاً لنشر المخرجات',
			'publish.lastBuild' => 'آخر بناء',
			'publish.configureNow' => 'تكوين الآن',
			'publish.fastlaneMissing' => 'Fastlane غير موجود',
			'publish.fastlaneMissingMessage' => 'Fastlane مطلوب للنشر. تريد تثبيته؟',
			'publish.install' => 'تثبيت',
			'publish.configMissing' => 'إعداد Fastlane غير موجود',
			'publish.configMissingMessage' => 'إعداد Fastlane (Fastfile, Appfile) مطلوب للنشر.',
			'publish.retry' => 'إعادة المحاولة',
			'publish.stop' => 'إيقاف',
			'publish.publishLogTitle' => 'مخرجات النشر',
			'publish.firebase' => 'Firebase App Distribution',
			'publish.googlePlay' => 'Google Play Console',
			'publish.appStoreConnect' => 'App Store Connect (TestFlight)',
			'publish.internal' => 'داخلي',
			'publish.closed' => 'مغلق',
			'publish.production' => 'إنتاج',
			'publish.publishProfiles' => 'ملفات النشر الشخصية',
			'publish.configureProfile' => 'تكوين الملف الشخصي',
			'publish.newPublishProfile' => 'ملف نشر شخصي جديد',
			'publish.firebaseAppId' => 'معرف تطبيق Firebase',
			'publish.firebaseAppIdHint' => '1:123:android:abc',
			'publish.firebaseToken' => 'رمز Firebase (يُخزّن بأمان)',
			'publish.playPackageName' => 'اسم الحزمة',
			'publish.playPackageNameHint' => 'com.example.app',
			'publish.playServiceAccount' => 'مسار JSON لحساب الخدمة',
			'publish.ascBundleId' => 'معرف الحزمة',
			'publish.ascBundleIdHint' => 'com.example.app',
			'publish.ascAppleId' => 'Apple ID (البريد الإلكتروني)',
			'publish.ascAppleIdHint' => 'developer@example.com',
			'publish.ascTeamId' => 'معرف الفريق (Developer Portal)',
			'publish.ascItcTeamId' => 'معرف فريق ITC (App Store Connect)',
			'publish.ascApplePassword' => 'كلمة مرور التطبيق (يُخزّن بأمان)',
			'publish.ascApiKeyId' => 'معرف مفتاح API',
			'publish.ascIssuerId' => 'معرف المُصدر',
			'publish.ascApiKeyPath' => 'مسار مفتاح API (.p8)',
			'publish.ascAppleIdAuth' => 'مصادقة Apple ID',
			'publish.ascApiKeyAuth' => 'مصادقة مفتاح API (بديل)',
			'publish.notificationSuccessTitle' => '✅ تم النشر بنجاح!',
			'publish.notificationSuccessBody' => 'تم توزيع البناء الخاص بك.',
			'publish.notificationSuccessSubtitle' => ({required Object platform, required Object track}) => 'المنصة: ${platform} • المسار: ${track}',
			'publish.notificationSuccessSubtitlePlatform' => ({required Object platform}) => 'المنصة: ${platform}',
			'publish.notificationErrorTitle' => '❌ فشل النشر',
			'publish.notificationErrorSubtitle' => 'BuildPaw',
			'publish.notificationErrorBody' => 'تحقق من السجلات للتفاصيل.',
			_ => null,
		};
	}
}
