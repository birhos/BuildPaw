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
class TranslationsRu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppRu app = _TranslationsAppRu._(_root);
	@override late final _TranslationsCommonRu common = _TranslationsCommonRu._(_root);
	@override late final _TranslationsProjectSelectorRu projectSelector = _TranslationsProjectSelectorRu._(_root);
	@override late final _TranslationsProjectInfoRu projectInfo = _TranslationsProjectInfoRu._(_root);
	@override late final _TranslationsConfigRu config = _TranslationsConfigRu._(_root);
	@override late final _TranslationsExportDialogRu exportDialog = _TranslationsExportDialogRu._(_root);
	@override late final _TranslationsProfileRu profile = _TranslationsProfileRu._(_root);
	@override late final _TranslationsBuildRu build = _TranslationsBuildRu._(_root);
	@override late final _TranslationsBuildLogRu buildLog = _TranslationsBuildLogRu._(_root);
	@override late final _TranslationsBuildStatusRu buildStatus = _TranslationsBuildStatusRu._(_root);
	@override late final _TranslationsPlatformsRu platforms = _TranslationsPlatformsRu._(_root);
	@override late final _TranslationsPlatformConfigRu platformConfig = _TranslationsPlatformConfigRu._(_root);
	@override late final _TranslationsAndroidOutputRu androidOutput = _TranslationsAndroidOutputRu._(_root);
	@override late final _TranslationsIosOutputRu iosOutput = _TranslationsIosOutputRu._(_root);
	@override late final _TranslationsBuildModeRu buildMode = _TranslationsBuildModeRu._(_root);
	@override late final _TranslationsPwaStrategyRu pwaStrategy = _TranslationsPwaStrategyRu._(_root);
	@override late final _TranslationsLanguageRu language = _TranslationsLanguageRu._(_root);
	@override late final _TranslationsThemeRu theme = _TranslationsThemeRu._(_root);
}

// Path: app
class _TranslationsAppRu extends TranslationsAppEn {
	_TranslationsAppRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get name => 'BuildPaw';
}

// Path: common
class _TranslationsCommonRu extends TranslationsCommonEn {
	_TranslationsCommonRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Отмена';
	@override String get export => 'Экспорт';
	@override String get browse => 'Обзор';
	@override String get save => 'Сохранить';
	@override String get delete => 'Удалить';
}

// Path: projectSelector
class _TranslationsProjectSelectorRu extends TranslationsProjectSelectorEn {
	_TranslationsProjectSelectorRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'BuildPaw';
	@override String get hint => 'Выберите каталог проекта Flutter...';
	@override String get selectDialogTitle => 'Выбор проекта Flutter';
}

// Path: projectInfo
class _TranslationsProjectInfoRu extends TranslationsProjectInfoEn {
	_TranslationsProjectInfoRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Информация о проекте';
	@override String get generalTab => 'Общее';
	@override String get dependenciesTab => 'Зависимости';
	@override String get refreshTooltip => 'Обновить информацию о проекте';
	@override String get fvmActive => 'FVM Активен';
	@override String get fvmInactive => 'Нет FVM';
	@override String get noDependencies => 'Зависимости не найдены';
	@override String get package => 'Пакет';
	@override String get version => 'Версия';
}

// Path: config
class _TranslationsConfigRu extends TranslationsConfigEn {
	_TranslationsConfigRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get export => 'Экспорт конфигурации';
	@override String get import => 'Импорт конфигурации';
	@override String exportSuccess({required Object path}) => 'Конфигурация экспортирована в ${path}';
	@override String get exportCancelled => 'Экспорт отменён.';
	@override String importSuccess({required Object name}) => 'Импортировано: ${name}';
	@override String get importCancelled => 'Импорт отменён или файл недействителен.';
	@override String get dropToImport => 'Перетащите JSON-файл для импорта конфигурации';
}

// Path: exportDialog
class _TranslationsExportDialogRu extends TranslationsExportDialogEn {
	_TranslationsExportDialogRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Экспорт конфигурации сборки';
	@override String get presetName => 'Название пресета';
	@override String get presetNameHint => 'напр. release-prod';
	@override String get version => 'Версия';
	@override String get versionHint => 'напр. 1.0.0';
}

// Path: profile
class _TranslationsProfileRu extends TranslationsProfileEn {
	_TranslationsProfileRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Профили';
	@override String get noProfiles => 'Нет сохранённых профилей';
	@override String get saveProfile => 'Сохранить профиль';
	@override String get newProfile => 'Новый профиль';
	@override String get profileName => 'Название профиля';
	@override String get profileNameHint => 'напр. release-prod';
	@override String get version => 'Версия';
	@override String get versionHint => 'напр. 1.0.0';
	@override String saveSuccess({required Object name}) => 'Профиль \'${name}\' сохранён';
	@override String deleteConfirm({required Object name}) => 'Удалить профиль \'${name}\'?';
	@override String get deleteSuccess => 'Профиль удалён';
	@override String applied({required Object name}) => 'Профиль \'${name}\' применён';
	@override String get updateExisting => 'Обновить существующий';
	@override String get saveAsNew => 'Сохранить как новый';
	@override String overwriteConfirm({required Object name}) => 'Профиль \'${name}\' уже существует. Перезаписать?';
}

// Path: build
class _TranslationsBuildRu extends TranslationsBuildEn {
	_TranslationsBuildRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get button => 'СБОРКА';
	@override String get building => 'Сборка...';
	@override String buildingPlatform({required Object platform, required Object completed, required Object total}) => 'Сборка ${platform}... (${completed}/${total})';
	@override String get cancel => 'Отмена';
}

// Path: buildLog
class _TranslationsBuildLogRu extends TranslationsBuildLogEn {
	_TranslationsBuildLogRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Вывод сборки';
	@override String get copyTooltip => 'Копировать логи';
	@override String get copied => 'Логи скопированы в буфер обмена';
	@override String get placeholder => 'Вывод сборки появится здесь...';
}

// Path: buildStatus
class _TranslationsBuildStatusRu extends TranslationsBuildStatusEn {
	_TranslationsBuildStatusRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get idle => 'Ожидание';
	@override String get running => 'Выполняется';
	@override String get success => 'Успех';
	@override String get failed => 'Ошибка';
}

// Path: platforms
class _TranslationsPlatformsRu extends TranslationsPlatformsEn {
	_TranslationsPlatformsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get android => 'Android';
	@override String get ios => 'iOS';
	@override String get web => 'Web';
}

// Path: platformConfig
class _TranslationsPlatformConfigRu extends TranslationsPlatformConfigEn {
	_TranslationsPlatformConfigRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get outputType => 'Тип вывода';
	@override String get codeObfuscation => 'Обфускация кода';
	@override String get splitDebugInfo => 'Split Debug Info';
	@override String get flavor => 'Flavor';
	@override String get flavorHint => 'напр. dev, staging, prod';
	@override String get runMode => 'Режим запуска';
	@override String get target => 'Цель';
	@override String get targetHint => 'lib/main.dart';
	@override String get pwaStrategy => 'Стратегия PWA';
	@override String get noTreeShakeIcons => 'No Tree Shake Icons';
}

// Path: androidOutput
class _TranslationsAndroidOutputRu extends TranslationsAndroidOutputEn {
	_TranslationsAndroidOutputRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get apk => 'Только APK';
	@override String get aab => 'Только AAB';
	@override String get both => 'APK и AAB';
}

// Path: iosOutput
class _TranslationsIosOutputRu extends TranslationsIosOutputEn {
	_TranslationsIosOutputRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get ios => 'iOS (Runner.app)';
	@override String get ipa => 'IPA (Экспортируемый)';
}

// Path: buildMode
class _TranslationsBuildModeRu extends TranslationsBuildModeEn {
	_TranslationsBuildModeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get debug => 'Debug';
	@override String get profile => 'Profile';
	@override String get release => 'Release';
}

// Path: pwaStrategy
class _TranslationsPwaStrategyRu extends TranslationsPwaStrategyEn {
	_TranslationsPwaStrategyRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get kDefault => 'По умолчанию';
	@override String get none => 'Нет';
}

// Path: language
class _TranslationsLanguageRu extends TranslationsLanguageEn {
	_TranslationsLanguageRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Язык';
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
class _TranslationsThemeRu extends TranslationsThemeEn {
	_TranslationsThemeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Тема';
	@override String get dark => 'Тёмная';
	@override String get light => 'Светлая';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'BuildPaw',
			'common.cancel' => 'Отмена',
			'common.export' => 'Экспорт',
			'common.browse' => 'Обзор',
			'common.save' => 'Сохранить',
			'common.delete' => 'Удалить',
			'projectSelector.title' => 'BuildPaw',
			'projectSelector.hint' => 'Выберите каталог проекта Flutter...',
			'projectSelector.selectDialogTitle' => 'Выбор проекта Flutter',
			'projectInfo.title' => 'Информация о проекте',
			'projectInfo.generalTab' => 'Общее',
			'projectInfo.dependenciesTab' => 'Зависимости',
			'projectInfo.refreshTooltip' => 'Обновить информацию о проекте',
			'projectInfo.fvmActive' => 'FVM Активен',
			'projectInfo.fvmInactive' => 'Нет FVM',
			'projectInfo.noDependencies' => 'Зависимости не найдены',
			'projectInfo.package' => 'Пакет',
			'projectInfo.version' => 'Версия',
			'config.export' => 'Экспорт конфигурации',
			'config.import' => 'Импорт конфигурации',
			'config.exportSuccess' => ({required Object path}) => 'Конфигурация экспортирована в ${path}',
			'config.exportCancelled' => 'Экспорт отменён.',
			'config.importSuccess' => ({required Object name}) => 'Импортировано: ${name}',
			'config.importCancelled' => 'Импорт отменён или файл недействителен.',
			'config.dropToImport' => 'Перетащите JSON-файл для импорта конфигурации',
			'exportDialog.title' => 'Экспорт конфигурации сборки',
			'exportDialog.presetName' => 'Название пресета',
			'exportDialog.presetNameHint' => 'напр. release-prod',
			'exportDialog.version' => 'Версия',
			'exportDialog.versionHint' => 'напр. 1.0.0',
			'profile.title' => 'Профили',
			'profile.noProfiles' => 'Нет сохранённых профилей',
			'profile.saveProfile' => 'Сохранить профиль',
			'profile.newProfile' => 'Новый профиль',
			'profile.profileName' => 'Название профиля',
			'profile.profileNameHint' => 'напр. release-prod',
			'profile.version' => 'Версия',
			'profile.versionHint' => 'напр. 1.0.0',
			'profile.saveSuccess' => ({required Object name}) => 'Профиль \'${name}\' сохранён',
			'profile.deleteConfirm' => ({required Object name}) => 'Удалить профиль \'${name}\'?',
			'profile.deleteSuccess' => 'Профиль удалён',
			'profile.applied' => ({required Object name}) => 'Профиль \'${name}\' применён',
			'profile.updateExisting' => 'Обновить существующий',
			'profile.saveAsNew' => 'Сохранить как новый',
			'profile.overwriteConfirm' => ({required Object name}) => 'Профиль \'${name}\' уже существует. Перезаписать?',
			'build.button' => 'СБОРКА',
			'build.building' => 'Сборка...',
			'build.buildingPlatform' => ({required Object platform, required Object completed, required Object total}) => 'Сборка ${platform}... (${completed}/${total})',
			'build.cancel' => 'Отмена',
			'buildLog.title' => 'Вывод сборки',
			'buildLog.copyTooltip' => 'Копировать логи',
			'buildLog.copied' => 'Логи скопированы в буфер обмена',
			'buildLog.placeholder' => 'Вывод сборки появится здесь...',
			'buildStatus.idle' => 'Ожидание',
			'buildStatus.running' => 'Выполняется',
			'buildStatus.success' => 'Успех',
			'buildStatus.failed' => 'Ошибка',
			'platforms.android' => 'Android',
			'platforms.ios' => 'iOS',
			'platforms.web' => 'Web',
			'platformConfig.outputType' => 'Тип вывода',
			'platformConfig.codeObfuscation' => 'Обфускация кода',
			'platformConfig.splitDebugInfo' => 'Split Debug Info',
			'platformConfig.flavor' => 'Flavor',
			'platformConfig.flavorHint' => 'напр. dev, staging, prod',
			'platformConfig.runMode' => 'Режим запуска',
			'platformConfig.target' => 'Цель',
			'platformConfig.targetHint' => 'lib/main.dart',
			'platformConfig.pwaStrategy' => 'Стратегия PWA',
			'platformConfig.noTreeShakeIcons' => 'No Tree Shake Icons',
			'androidOutput.apk' => 'Только APK',
			'androidOutput.aab' => 'Только AAB',
			'androidOutput.both' => 'APK и AAB',
			'iosOutput.ios' => 'iOS (Runner.app)',
			'iosOutput.ipa' => 'IPA (Экспортируемый)',
			'buildMode.debug' => 'Debug',
			'buildMode.profile' => 'Profile',
			'buildMode.release' => 'Release',
			'pwaStrategy.kDefault' => 'По умолчанию',
			'pwaStrategy.none' => 'Нет',
			'language.title' => 'Язык',
			'language.english' => 'English',
			'language.turkish' => 'Türkçe',
			'language.arabic' => 'العربية',
			'language.german' => 'Deutsch',
			'language.french' => 'Français',
			'language.chinese' => '简体中文',
			'language.russian' => 'Русский',
			'language.hindi' => 'हिन्दी',
			'theme.title' => 'Тема',
			'theme.dark' => 'Тёмная',
			'theme.light' => 'Светлая',
			_ => null,
		};
	}
}
