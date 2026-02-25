import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application/build_config/build_config_cubit.dart';
import 'application/build_execution/build_execution_bloc.dart';
import 'application/project/project_cubit.dart';
import 'application/services/artifact_manager.dart';
import 'application/services/build_command_generator.dart';
import 'application/theme/theme_cubit.dart';
import 'application/theme/theme_state.dart';
import 'core/theme/app_theme.dart';
import 'i18n/strings.g.dart';
import 'infrastructure/services/file_system_service.dart';
import 'infrastructure/services/flutter_service.dart';
import 'infrastructure/services/git_service.dart';
import 'infrastructure/services/process_service.dart';
import 'presentation/pages/home_page.dart';

class BuildPawApp extends StatelessWidget {
  const BuildPawApp({super.key});

  @override
  Widget build(BuildContext context) {
    final processService = ProcessService();
    final gitService = GitService(processService);
    final flutterService = FlutterService(processService);
    final fileSystemService = FileSystemService();
    final commandGenerator = BuildCommandGenerator();
    final artifactManager = ArtifactManager(fileSystemService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProjectCubit(
            gitService: gitService,
            flutterService: flutterService,
          ),
        ),
        BlocProvider(create: (_) => BuildConfigCubit()),
        BlocProvider(
          create: (_) => BuildExecutionBloc(
            processService: processService,
            commandGenerator: commandGenerator,
            artifactManager: artifactManager,
          ),
        ),
      ],
      child: TranslationProvider(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          buildWhen: (prev, curr) => prev != curr,
          builder: (context, themeState) {
            final isDark = switch (themeState) {
              ThemeLoaded(mode: AppThemeMode.dark) => true,
              ThemeLoaded(mode: AppThemeMode.light) => false,
            };
            return Builder(
              builder: (context) => MaterialApp(
                title: 'BuildPaw',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
                locale: TranslationProvider.of(context).flutterLocale,
                supportedLocales: AppLocaleUtils.supportedLocales,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const HomePage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
