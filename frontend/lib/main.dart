// lib/main.dart
// 앱 진입점

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_router.dart';
import 'package:todo_app/common/theme_provider.dart';
import 'package:todo_app/screens/map_screen.dart';
import 'package:todo_app/screens/scaffold_screen.dart';
import 'common/app_styles.dart';
import 'common/constants.dart';
import 'providers/todo_provider.dart';
import 'screens/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            theme: themeProvider.themeData,
            // home: const TodoListScreen(),
            // home: const MapScreen(),
            home: const ScaffoldScreen(),
          );

          // return MaterialApp.router(
          //   debugShowCheckedModeBanner: false,
          //   theme: themeProvider.themeData,
          //   routerConfig: AppRouter.router,
          // );

        },
      )
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TodoProvider())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme:  ThemeData(
          useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            scaffoldBackgroundColor: AppColors.background
        ),
          home: const TodoListScreen()
      ),
    );
  }
}

 */