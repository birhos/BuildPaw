import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'application/application.dart';

Future<void> bootstrap() async {
  final localeCubit = LocaleCubit();
  final themeCubit = ThemeCubit();
  await localeCubit.init();
  await themeCubit.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>.value(value: localeCubit),
        BlocProvider<ThemeCubit>.value(value: themeCubit),
      ],
      child: const BuildPawApp(),
    ),
  );
}
