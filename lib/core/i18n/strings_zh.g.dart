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
	@override late final _TranslationsPublishZh publish = _TranslationsPublishZh._(_root);
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

// Path: publish
class _TranslationsPublishZh extends TranslationsPublishEn {
	_TranslationsPublishZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get tab => '发布';
	@override String get button => '发布';
	@override String get target => '目标';
	@override String get profile => '配置文件';
	@override String get releaseNotes => '发布说明';
	@override String get releaseNotesHint => '可选发布说明...';
	@override String get testerGroup => '测试组';
	@override String get testerGroupHint => '例如 testers';
	@override String get track => '轨道';
	@override String get noProfile => '未选择配置文件';
	@override String get noProject => '请先选择项目';
	@override String get noBuildOutput => '请先运行构建以发布产物';
	@override String get lastBuild => '上次构建';
	@override String get configureNow => '立即配置';
	@override String get fastlaneMissing => '未找到 Fastlane';
	@override String get fastlaneMissingMessage => '发布需要 Fastlane。是否安装？';
	@override String get install => '安装';
	@override String get configMissing => '未找到 Fastlane 配置';
	@override String get configMissingMessage => '发布需要 Fastlane 配置（Fastfile、Appfile）。';
	@override String get retry => '重试';
	@override String get stop => '停止';
	@override String get publishLogTitle => '发布输出';
	@override String get firebase => 'Firebase App Distribution';
	@override String get googlePlay => 'Google Play Console';
	@override String get appStoreConnect => 'App Store Connect (TestFlight)';
	@override String get internal => '内部';
	@override String get closed => '封闭';
	@override String get production => '生产';
	@override String get publishProfiles => '发布配置文件';
	@override String get configureProfile => '配置配置文件';
	@override String get newPublishProfile => '新建发布配置文件';
	@override String get firebaseAppId => 'Firebase 应用 ID';
	@override String get firebaseAppIdHint => '1:123:android:abc';
	@override String get firebaseToken => 'Firebase 令牌（安全存储）';
	@override String get playPackageName => '包名';
	@override String get playPackageNameHint => 'com.example.app';
	@override String get playServiceAccount => '服务账号 JSON 路径';
	@override String get ascBundleId => 'Bundle ID';
	@override String get ascBundleIdHint => 'com.example.app';
	@override String get ascAppleId => 'Apple ID（邮箱）';
	@override String get ascAppleIdHint => 'developer@example.com';
	@override String get ascTeamId => '团队 ID（Developer Portal）';
	@override String get ascItcTeamId => 'ITC 团队 ID（App Store Connect）';
	@override String get ascApplePassword => '应用专用密码（安全存储）';
	@override String get ascApiKeyId => 'API 密钥 ID';
	@override String get ascIssuerId => '颁发者 ID';
	@override String get ascApiKeyPath => 'API 密钥 (.p8) 路径';
	@override String get ascAppleIdAuth => 'Apple ID 认证';
	@override String get ascApiKeyAuth => 'API 密钥认证（替代）';
	@override String get notificationSuccessTitle => '✅ 发布成功！';
	@override String get notificationSuccessBody => '您的构建已分发。';
	@override String notificationSuccessSubtitle({required Object platform, required Object track}) => '平台：${platform} • 轨道：${track}';
	@override String notificationSuccessSubtitlePlatform({required Object platform}) => '平台：${platform}';
	@override String get notificationErrorTitle => '❌ 发布失败';
	@override String get notificationErrorSubtitle => 'BuildPaw';
	@override String get notificationErrorBody => '请查看日志了解详情。';
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
			'publish.tab' => '发布',
			'publish.button' => '发布',
			'publish.target' => '目标',
			'publish.profile' => '配置文件',
			'publish.releaseNotes' => '发布说明',
			'publish.releaseNotesHint' => '可选发布说明...',
			'publish.testerGroup' => '测试组',
			'publish.testerGroupHint' => '例如 testers',
			'publish.track' => '轨道',
			'publish.noProfile' => '未选择配置文件',
			'publish.noProject' => '请先选择项目',
			'publish.noBuildOutput' => '请先运行构建以发布产物',
			'publish.lastBuild' => '上次构建',
			'publish.configureNow' => '立即配置',
			'publish.fastlaneMissing' => '未找到 Fastlane',
			'publish.fastlaneMissingMessage' => '发布需要 Fastlane。是否安装？',
			'publish.install' => '安装',
			'publish.configMissing' => '未找到 Fastlane 配置',
			'publish.configMissingMessage' => '发布需要 Fastlane 配置（Fastfile、Appfile）。',
			'publish.retry' => '重试',
			'publish.stop' => '停止',
			'publish.publishLogTitle' => '发布输出',
			'publish.firebase' => 'Firebase App Distribution',
			'publish.googlePlay' => 'Google Play Console',
			'publish.appStoreConnect' => 'App Store Connect (TestFlight)',
			'publish.internal' => '内部',
			'publish.closed' => '封闭',
			'publish.production' => '生产',
			'publish.publishProfiles' => '发布配置文件',
			'publish.configureProfile' => '配置配置文件',
			'publish.newPublishProfile' => '新建发布配置文件',
			'publish.firebaseAppId' => 'Firebase 应用 ID',
			'publish.firebaseAppIdHint' => '1:123:android:abc',
			'publish.firebaseToken' => 'Firebase 令牌（安全存储）',
			'publish.playPackageName' => '包名',
			'publish.playPackageNameHint' => 'com.example.app',
			'publish.playServiceAccount' => '服务账号 JSON 路径',
			'publish.ascBundleId' => 'Bundle ID',
			'publish.ascBundleIdHint' => 'com.example.app',
			'publish.ascAppleId' => 'Apple ID（邮箱）',
			'publish.ascAppleIdHint' => 'developer@example.com',
			'publish.ascTeamId' => '团队 ID（Developer Portal）',
			'publish.ascItcTeamId' => 'ITC 团队 ID（App Store Connect）',
			'publish.ascApplePassword' => '应用专用密码（安全存储）',
			'publish.ascApiKeyId' => 'API 密钥 ID',
			'publish.ascIssuerId' => '颁发者 ID',
			'publish.ascApiKeyPath' => 'API 密钥 (.p8) 路径',
			'publish.ascAppleIdAuth' => 'Apple ID 认证',
			'publish.ascApiKeyAuth' => 'API 密钥认证（替代）',
			'publish.notificationSuccessTitle' => '✅ 发布成功！',
			'publish.notificationSuccessBody' => '您的构建已分发。',
			'publish.notificationSuccessSubtitle' => ({required Object platform, required Object track}) => '平台：${platform} • 轨道：${track}',
			'publish.notificationSuccessSubtitlePlatform' => ({required Object platform}) => '平台：${platform}',
			'publish.notificationErrorTitle' => '❌ 发布失败',
			'publish.notificationErrorSubtitle' => 'BuildPaw',
			'publish.notificationErrorBody' => '请查看日志了解详情。',
			_ => null,
		};
	}
}
