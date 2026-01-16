import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/screens/theme_setting_screen.dart';
import 'package:todo_app/screens/todo_detail_screen.dart';
import 'package:todo_app/screens/todo_list_screen.dart';

import '../screens/settings_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',

    routes: [
      // 홈 화면
      GoRoute(
        path: "/",
        name: "home",
        builder: (context, state) => const TodoListScreen(),
      ),
      // 테마 설정 화면
      GoRoute(
        path: "/theme-settings",
        name: "theme",
        builder: (context, state) => const ThemeSettingScreen(),
      ),
      // 로그인 화면
      // GoRoute(
      //   path: "/login",
      //   name: "login",
      //   builder: (context, state) => const LoginScreen(),
      // ),
      GoRoute(
        path: '/todo/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          // TODO: id를 사용한 화면 구현
          return TodoDetailScreen(id: id);
        }
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => SettingsScreen(),
        routes: [
          // TODO: 하위 라우트 추가
        ]
      )
    ],

    // TODO: errorBuilder 추가
    // 404 페이지를 보여주도록 구현
    errorBuilder: (context, state) => const Scaffold(
      body: Text('Page Not Found'),
    ),
  );
}
