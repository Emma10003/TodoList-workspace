// lib/common/env_config.dart
// 환경 설정 파일 (선택 과제)

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  // static String get apiBasUrl => dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080/api';
  // static String get apiBasUrl => dotenv.env['API_BASE_URL'] ?? 'http://10.0.2.2:8080/api';
  static String get apiBasUrl => dotenv.env['API_BASE_URL'] ?? 'http://192.168.1.103:8080/api';
  static String get environment => dotenv.env['ENVIRONMENT'] ?? 'development';
  static bool get isDevelopment => environment == 'development';
  static bool get isDebugMode => environment == 'development';

  static printEnvInfo() {
    print("======= 환경 설정 =======");
    print("Environment: $environment");
    print("API URL: $apiBasUrl");
    print("========================");
  }
}