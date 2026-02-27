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
    final publishProfileRepo = PublishProfileRepository();
    final notificationService = NotificationService();

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

        //
        BlocProvider(create: (_) => LastBuildOutputCubit()),

        //
        BlocProvider(
          create: (_) => PublishProfileCubit(
            repository: publishProfileRepo,
          )..loadProfiles(),
        ),

        //
        BlocProvider(
          create: (context) => PublishCubit(
            fastlaneDetector: FastlaneDetector(processService),
            fastlaneInstaller: FastlaneInstaller(processService),
            fastlaneExecutor: FastlaneExecutor(processService),
            notificationService: notificationService,
            lastBuildOutput: context.read<LastBuildOutputCubit>(),
            profileRepository: publishProfileRepo,
            processService: processService,
            flutterService: flutterService,
          ),
        ),
      ],
      child: TranslationProvider(
        child: BlocListener<BuildExecutionBloc, BuildExecutionState>(
          listenWhen: (prev, curr) => curr is BuildSuccess,
          listener: (context, state) {
            if (state is BuildSuccess &&
                state.outputPath.isNotEmpty &&
                state.projectPath.isNotEmpty) {
              context.read<LastBuildOutputCubit>().setLastBuild(
                    outputPath: state.outputPath,
                    projectName: state.projectName,
                    projectPath: state.projectPath,
                  );
            }
          },
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
            final locale = TranslationProvider.of(context).flutterLocale;
            final isRtl = locale.languageCode == 'ar';

            return MaterialApp(
              title: 'BuildPaw',
              debugShowCheckedModeBanner: false,

              // * Theme
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,

              // * Localization
              locale: locale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

              // * RTL/LTR
              builder: (context, child) {
                return Directionality(
                  textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                  child: child!,
                );
              },
              home: const HomePage(),
            );
          },
        ),
        ),
      ),
    );
  }
}
