import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/src/app/app_colors.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_bloc.dart';
import 'package:movies_task/src/features/home/data/repo/movies_repo.dart';
import 'package:movies_task/src/features/home/view/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(HomeRepository()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            useMaterial3: true,
          ),
          home: HomePage(),
        ));
  }
}
