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
class TranslationsZh extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppZh app = _TranslationsAppZh._(_root);
	@override late final _TranslationsCommonZh common = _TranslationsCommonZh._(_root);
	@override late final _TranslationsProjectSelectorZh projectSelector = _TranslationsProjectSelectorZh._(_root);
	@override late final _TranslationsProjectInfoZh projectInfo = _TranslationsProjectInfoZh._(_root);
	@override late final _TranslationsConfigZh config = _TranslationsConfigZh._(_root);
	@override late final _TranslationsExportDialogZh exportDialog = _TranslationsExportDialogZh._(_root);
	@override late final _TranslationsProfileZh profile = _TranslationsProfileZh._(_root);
	@override late final _TranslationsBuildZh build = _TranslationsBuildZh._(_root);
	@override late final _TranslationsBuildLogZh buildLog = _TranslationsBuildLogZh._(_root);
	@override late final _TranslationsBuildStatusZh buildStatus = _TranslationsBuildStatusZh._(_root);
	@override late final _TranslationsPlatformsZh platforms = _TranslationsPlatformsZh._(_root);
	@override late final _TranslationsPlatformConfigZh platformConfig = _TranslationsPlatformConfigZh._(_root);
	@override late final _TranslationsAndroidOutputZh androidOutput = _TranslationsAndroidOutputZh._(_root);
	@override late final _TranslationsIosOutputZh iosOutput = _TranslationsIosOutputZh._(_root);
	@override late final _TranslationsBuildModeZh buildMode = _TranslationsBuildModeZh._(_root);
	@override late final _TranslationsPwaStrategyZh pwaStrategy = _TranslationsPwaStrategyZh._(_root);
	@override late final _TranslationsLanguageZh language = _TranslationsLanguageZh._(_root);
	@override late final _TranslationsThemeZh theme = _TranslationsThemeZh._(_root);
}

// Path: app
class _TranslationsAppZh extends TranslationsAppEn {
	_TranslationsAppZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => 'BuildPaw';
}

// Path: common
class _TranslationsCommonZh extends TranslationsCommonEn {
	_TranslationsCommonZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get export => '导出';
	@override String get browse => '浏览';
	@override String get save => '保存';
	@override String get delete => '删除';
}

// Path: projectSelector
class _TranslationsProjectSelectorZh extends TranslationsProjectSelectorEn {
	_TranslationsProjectSelectorZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => 'BuildPaw';
	@override String get hint => '选择Flutter项目目录...';
	@override String get selectDialogTitle => '选择Flutter项目';
}

// Path: projectInfo
class _TranslationsProjectInfoZh extends TranslationsProjectInfoEn {
	_TranslationsProjectInfoZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '项目信息';
	@override String get generalTab => '概览';
	@override String get dependenciesTab => '依赖项';
	@override String get refreshTooltip => '刷新项目信息';
	@override String get fvmActive => 'FVM 已启用';
	@override String get fvmInactive => '无 FVM';
	@override String get noDependencies => '未找到依赖项';
	@override String get package => '包名';
	@override String get version => '版本';
}

// Path: config
class _TranslationsConfigZh extends TranslationsConfigEn {
	_TranslationsConfigZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get export => '导出配置';
	@override String get import => '导入配置';
	@override String exportSuccess({required Object path}) => '配置已导出至 ${path}';
	@override String get exportCancelled => '导出已取消。';
	@override String importSuccess({required Object name}) => '已导入：${name}';
	@override String get importCancelled => '导入已取消或文件无效。';
	@override String get dropToImport => '拖放JSON文件以导入配置';
}

// Path: exportDialog
class _TranslationsExportDialogZh extends TranslationsExportDialogEn {
	_TranslationsExportDialogZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '导出构建配置';
	@override String get presetName => '预设名称';
	@override String get presetNameHint => '例如 release-prod';
	@override String get version => '版本';
	@override String get versionHint => '例如 1.0.0';
}

// Path: profile
class _TranslationsProfileZh extends TranslationsProfileEn {
	_TranslationsProfileZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '配置文件';
	@override String get noProfiles => '没有已保存的配置文件';
	@override String get saveProfile => '保存配置文件';
	@override String get newProfile => '新建配置文件';
	@override String get profileName => '配置文件名称';
	@override String get profileNameHint => '例如 release-prod';
	@override String get version => '版本';
	@override String get versionHint => '例如 1.0.0';
	@override String saveSuccess({required Object name}) => '配置文件 \'${name}\' 已保存';
	@override String deleteConfirm({required Object name}) => '删除配置文件 \'${name}\'？';
	@override String get deleteSuccess => '配置文件已删除';
	@override String applied({required Object name}) => '已应用配置文件 \'${name}\'';
	@override String get updateExisting => '更新现有';
	@override String get saveAsNew => '另存为新';
	@override String overwriteConfirm({required Object name}) => '配置文件 \'${name}\' 已存在。是否覆盖？';
}

// Path: build
class _TranslationsBuildZh extends TranslationsBuildEn {
	_TranslationsBuildZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get button => '构建';
	@override String get building => '构建中...';
	@override String buildingPlatform({required Object platform, required Object completed, required Object total}) => '正在构建 ${platform}...（${completed}/${total}）';
	@override String get cancel => '取消';
}

// Path: buildLog
class _TranslationsBuildLogZh extends TranslationsBuildLogEn {
	_TranslationsBuildLogZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '构建输出';
	@override String get copyTooltip => '复制日志';
	@override String get copied => '日志已复制到剪贴板';
	@override String get placeholder => '构建输出将显示在这里...';
}

// Path: buildStatus
class _TranslationsBuildStatusZh extends TranslationsBuildStatusEn {
	_TranslationsBuildStatusZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get idle => '空闲';
	@override String get running => '运行中';
	@override String get success => '成功';
	@override String get failed => '失败';
}

// Path: platforms
class _TranslationsPlatformsZh extends TranslationsPlatformsEn {
	_TranslationsPlatformsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get android => 'Android';
	@override String get ios => 'iOS';
	@override String get web => 'Web';
}

// Path: platformConfig
class _TranslationsPlatformConfigZh extends TranslationsPlatformConfigEn {
	_TranslationsPlatformConfigZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get outputType => '输出类型';
	@override String get codeObfuscation => '代码混淆';
	@override String get splitDebugInfo => 'Split Debug Info';
	@override String get flavor => 'Flavor';
	@override String get flavorHint => '例如 dev, staging, prod';
	@override String get runMode => '运行模式';
	@override String get target => '目标';
	@override String get targetHint => 'lib/main.dart';
	@override String get pwaStrategy => 'PWA策略';
	@override String get noTreeShakeIcons => 'No Tree Shake Icons';
}

// Path: androidOutput
class _TranslationsAndroidOutputZh extends TranslationsAndroidOutputEn {
	_TranslationsAndroidOutputZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get apk => '仅APK';
	@override String get aab => '仅AAB';
	@override String get both => 'APK和AAB';
}

// Path: iosOutput
class _TranslationsIosOutputZh extends TranslationsIosOutputEn {
	_TranslationsIosOutputZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get ios => 'iOS (Runner.app)';
	@override String get ipa => 'IPA (可导出)';
}

// Path: buildMode
class _TranslationsBuildModeZh extends TranslationsBuildModeEn {
	_TranslationsBuildModeZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get debug => 'Debug';
	@override String get profile => 'Profile';
	@override String get release => 'Release';
}

// Path: pwaStrategy
class _TranslationsPwaStrategyZh extends TranslationsPwaStrategyEn {
	_TranslationsPwaStrategyZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get kDefault => '默认';
	@override String get none => '无';
}

// Path: language
class _TranslationsLanguageZh extends TranslationsLanguageEn {
	_TranslationsLanguageZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '语言';
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
class _TranslationsThemeZh extends TranslationsThemeEn {
	_TranslationsThemeZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '主题';
	@override String get dark => '深色';
	@override String get light => '浅色';
}

/// The flat map containing all translations for locale <zh>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'BuildPaw',
			'common.cancel' => '取消',
			'common.export' => '导出',
			'common.browse' => '浏览',
			'common.save' => '保存',
			'common.delete' => '删除',
			'projectSelector.title' => 'BuildPaw',
			'projectSelector.hint' => '选择Flutter项目目录...',
			'projectSelector.selectDialogTitle' => '选择Flutter项目',
			'projectInfo.title' => '项目信息',
			'projectInfo.generalTab' => '概览',
			'projectInfo.dependenciesTab' => '依赖项',
			'projectInfo.refreshTooltip' => '刷新项目信息',
			'projectInfo.fvmActive' => 'FVM 已启用',
			'projectInfo.fvmInactive' => '无 FVM',
			'projectInfo.noDependencies' => '未找到依赖项',
			'projectInfo.package' => '包名',
			'projectInfo.version' => '版本',
			'config.export' => '导出配置',
			'config.import' => '导入配置',
			'config.exportSuccess' => ({required Object path}) => '配置已导出至 ${path}',
			'config.exportCancelled' => '导出已取消。',
			'config.importSuccess' => ({required Object name}) => '已导入：${name}',
			'config.importCancelled' => '导入已取消或文件无效。',
			'config.dropToImport' => '拖放JSON文件以导入配置',
			'exportDialog.title' => '导出构建配置',
			'exportDialog.presetName' => '预设名称',
			'exportDialog.presetNameHint' => '例如 release-prod',
			'exportDialog.version' => '版本',
			'exportDialog.versionHint' => '例如 1.0.0',
			'profile.title' => '配置文件',
			'profile.noProfiles' => '没有已保存的配置文件',
			'profile.saveProfile' => '保存配置文件',
			'profile.newProfile' => '新建配置文件',
			'profile.profileName' => '配置文件名称',
			'profile.profileNameHint' => '例如 release-prod',
			'profile.version' => '版本',
			'profile.versionHint' => '例如 1.0.0',
			'profile.saveSuccess' => ({required Object name}) => '配置文件 \'${name}\' 已保存',
			'profile.deleteConfirm' => ({required Object name}) => '删除配置文件 \'${name}\'？',
			'profile.deleteSuccess' => '配置文件已删除',
			'profile.applied' => ({required Object name}) => '已应用配置文件 \'${name}\'',
			'profile.updateExisting' => '更新现有',
			'profile.saveAsNew' => '另存为新',
			'profile.overwriteConfirm' => ({required Object name}) => '配置文件 \'${name}\' 已存在。是否覆盖？',
			'build.button' => '构建',
			'build.building' => '构建中...',
			'build.buildingPlatform' => ({required Object platform, required Object completed, required Object total}) => '正在构建 ${platform}...（${completed}/${total}）',
			'build.cancel' => '取消',
			'buildLog.title' => '构建输出',
			'buildLog.copyTooltip' => '复制日志',
			'buildLog.copied' => '日志已复制到剪贴板',
			'buildLog.placeholder' => '构建输出将显示在这里...',
			'buildStatus.idle' => '空闲',
			'buildStatus.running' => '运行中',
			'buildStatus.success' => '成功',
			'buildStatus.failed' => '失败',
			'platforms.android' => 'Android',
			'platforms.ios' => 'iOS',
			'platforms.web' => 'Web',
			'platformConfig.outputType' => '输出类型',
			'platformConfig.codeObfuscation' => '代码混淆',
			'platformConfig.splitDebugInfo' => 'Split Debug Info',
			'platformConfig.flavor' => 'Flavor',
			'platformConfig.flavorHint' => '例如 dev, staging, prod',
			'platformConfig.runMode' => '运行模式',
			'platformConfig.target' => '目标',
			'platformConfig.targetHint' => 'lib/main.dart',
			'platformConfig.pwaStrategy' => 'PWA策略',
			'platformConfig.noTreeShakeIcons' => 'No Tree Shake Icons',
			'androidOutput.apk' => '仅APK',
			'androidOutput.aab' => '仅AAB',
			'androidOutput.both' => 'APK和AAB',
			'iosOutput.ios' => 'iOS (Runner.app)',
			'iosOutput.ipa' => 'IPA (可导出)',
			'buildMode.debug' => 'Debug',
			'buildMode.profile' => 'Profile',
			'buildMode.release' => 'Release',
			'pwaStrategy.kDefault' => '默认',
			'pwaStrategy.none' => '无',
			'language.title' => '语言',
			'language.english' => 'English',
			'language.turkish' => 'Türkçe',
			'language.arabic' => 'العربية',
			'language.german' => 'Deutsch',
			'language.french' => 'Français',
			'language.chinese' => '简体中文',
			'language.russian' => 'Русский',
			'language.hindi' => 'हिन्दी',
			'theme.title' => '主题',
			'theme.dark' => '深色',
			'theme.light' => '浅色',
			_ => null,
		};
	}
}
