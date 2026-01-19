// lib/main.dart
// 앱 진입점

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_router.dart';
import 'package:todo_app/common/theme_provider.dart';
import 'package:todo_app/providers/game_provider.dart';
import 'package:todo_app/providers/music_provider.dart';
import 'package:todo_app/screens/font_screen.dart';
import 'package:todo_app/screens/game_screen.dart';
import 'package:todo_app/screens/map_screen.dart';
import 'package:todo_app/screens/music_player_screen.dart';
import 'package:todo_app/screens/scaffold_screen.dart';
import 'common/app_styles.dart';
import 'common/constants.dart';
import 'providers/todo_provider.dart';
import 'screens/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => GameProvider(),
//       // create: (_) => MusicProvider(),
//         /**
//          * 💡 Think! 💡
//          * Consumer<GameProvider>와
//          * builder: (context, gameProvider, child)를
//          * 이쪽에서 작성하지 않고
//          * GameScreen에서 작성한 의도 확인
//          */
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: GameScreen(),
//         // home: MusicPlayerScreen(),
//       )
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            theme: themeProvider.themeData,
            // home: const TodoListScreen(),
            // home: const MapScreen(),
            // home: const ScaffoldScreen(),
            // home: const GameScreen(),
            home: const FontScreen(),
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