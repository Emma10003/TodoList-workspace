import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AppThemeType {
  purple,
  pink,
  blue,
  buttermallow,
  ocean,
}

// class ThemeProvider extends ChangeNotifier {
class ThemeProvider with ChangeNotifier {
  AppThemeType _currentTheme = AppThemeType.purple;

  final Set<AppThemeType> _purchasedThemes = {
    AppThemeType.purple,
    AppThemeType.buttermallow,
    AppThemeType.ocean,
  };

  AppThemeType get currentTheme => _currentTheme;

  bool isThemePurchased(AppThemeType theme) => _purchasedThemes.contains(theme);

  ThemeData get themeData {
    switch (_currentTheme) {
      case AppThemeType.purple:
        return _buildTheme(
          primary: const Color(0xFF6200EE),
          secondary: const Color(0xFF03DAC6),
        );
      case AppThemeType.pink:
        return _buildTheme(
          primary: const Color(0xFFE91E63),
          secondary: const Color(0xFF03DAC6),
        );
      case AppThemeType.blue:
        return _buildTheme(
          primary: const Color(0xFF2196F3),
          secondary: const Color(0xFF00BCD4),
        );
      case AppThemeType.buttermallow:
        return _buildTheme(
          primary: const Color(0xFFFFFACD),
          secondary: const Color(0xFFB8860B),
          tertiary: const Color(0xFFDEB887),
          error: const Color(0xFFDC143C),
        );
      case AppThemeType.ocean:
        return _buildTheme(
          primary: const Color(0xFF006494),
          secondary: const Color(0xFF00A8E8),
          tertiary: const Color(0xFF89CFF0),
        );
    }
  }

  ThemeData _buildTheme({
    required Color primary,
    required Color secondary,
    Color? tertiary,
    Color? error,
    // Brightness brightness = Brightness.light,
  }) {
    return ThemeData(
      useMaterial3: true,
      /*
      colorScheme: ColorScheme(
        primary: primary,
        onPrimary: Colors.white,
        primaryContainer: Color(0xFFBB86FC),
        onPrimaryContainer: Color(0xFF3700B3),
        secondary: secondary,
        brightness: null,
        onSecondary: null,
        error: null,
        onError: null,
        surface: null,
        onSurface: null,
      ),
      */
      // 위 ColorScheme 처럼 세부 속성을 설정하며 기본 primary 색상의 규정을
      // 세부속성을 설정하지 않은 디자인 구역에 배치하도록 쓸 수 있음.
      /*

      colorScheme: ColorScheme(
        // Primary Colors
        primary: primary,
        onPrimary: const Color(0xFF5C4A00),
        primaryContainer: const Color(0xFFFFF4A3),
        onPrimaryContainer: const Color(0xFF3d3200),

        // Secondary Colors
        secondary: secondary,
        onSecondary: Colors.white,
        secondaryContainer: const Color(0xFFF3E1B6),

        // Tertiary colors (버터스카치 베이지)
        tertiary: tertiary, // 0xFFDEB887
        onTertiary: const Color(0xFF4E3B2A),
        tertiaryContainer: const Color(0xFFF5E6D3),
        onTertiaryContainer: const Color(0xFF3A2A1C),

        // Error colors
        error: error ?? Color(0xFFDC143C), // 0xFFDC143C
        onError: Colors.white,
        errorContainer: const Color(0xFFF6B7C1),
        onErrorContainer: const Color(0xFF5A0A1A),

        // Surface colors (전체 배경 톤)
        surface: const Color(0xFFFFFEF8), // 아이보리 화이트
        onSurface: const Color(0xFF2E2E2E),
        surfaceContainerHighest: const Color(0xFFF2F0E8),
        onSurfaceVariant: const Color(0xFF5F5F5F),

        // Other
        outline: const Color(0xFFBDB59F),
        shadow: const Color(0x55000000),
        ),
     */

        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          secondary: secondary,
          tertiary: tertiary,
          error: error,
        ),

        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    );
  }

  void changeTheme(AppThemeType theme) {
    if(_purchasedThemes.contains(theme)) {
      _currentTheme = theme;
      notifyListeners();
    }
  }

  Future<bool> purchaseTheme(AppThemeType theme) async {
    await Future.delayed(const Duration(seconds: 1));

    _purchasedThemes.add(theme);
    notifyListeners();
    return true;
  }

  String getThemeName(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.purple:
        return 'Purple (Default)';
      case AppThemeType.pink:
        return 'Pink Theme';
      case AppThemeType.blue:
        return 'Blue Theme';
      case AppThemeType.buttermallow:
        return 'Buttermallow Theme';
      case AppThemeType.ocean:
        return 'Ocean Theme';
    }
  }

  String getThemePrice(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.purple:
        return 'Free';
      case AppThemeType.pink:
        return '2,200';
      case AppThemeType.blue:
        return '3,300';
      case AppThemeType.buttermallow:
        return 'Free';
      case AppThemeType.ocean:
        return 'Free';
    }
  }
}