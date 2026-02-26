import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application/application.dart';
import 'core/core.dart';
import 'infrastructure/infrastructure.dart';
import 'presentation/presentation.dart';

final class BuildPawApp extends StatelessWidget {
  const BuildPawApp({super.key});

  @override
  Widget build(BuildContext context) {
    final processService = ProcessService();
    final gitService = GitService(processService);
    final flutterService = FlutterService(processService);
    final fileSystemService = FileSystemService();
    final commandGenerator = BuildCommandGenerator();
    final artifactManager = ArtifactManager(fileSystemService);
    final profileStorageService = ProfileStorageService();

    return MultiBlocProvider(
      providers: [
        //
        BlocProvider(
          create: (_) => ProjectCubit(
            gitService: gitService,
            flutterService: flutterService,
          ),
        ),

        //
        BlocProvider(
          create: (_) => BuildConfigCubit(),
        ),

        //
        BlocProvider(
          create: (_) => ProfileCubit(
            storageService: profileStorageService,
          )..loadProfiles(),
        ),

        //
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
            return Builder(
              builder: (context) => MaterialApp(
                title: 'BuildPaw',
                debugShowCheckedModeBanner: false,
                home: const HomePage(),

                // * Theme
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,

                // * Localization
                locale: TranslationProvider.of(context).flutterLocale,
                supportedLocales: AppLocaleUtils.supportedLocales,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
