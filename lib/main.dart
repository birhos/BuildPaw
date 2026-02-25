import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'application/locale/locale_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localeCubit = LocaleCubit();
  await localeCubit.init();
  runApp(
    BlocProvider<LocaleCubit>.value(
      value: localeCubit,
      child: const BuildPawApp(),
    ),
  );
}
