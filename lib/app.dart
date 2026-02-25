import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application/application.dart';
import 'core/core.dart';
import 'infrastructure/infrastructure.dart';
import 'presentation/presentation.dart';

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
