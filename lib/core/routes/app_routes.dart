import 'package:flutter/material.dart';
import '../../features/bienvenida/welcome_screen.dart';
import '../../features/autenticacion/auth_screen.dart';
import '../../features/inicio/dashboard_screen.dart';

class AppRoutes {
  static const welcome = '/', login = '/login', register = '/register', dashboard = '/dashboard';
  static final routes = <String, WidgetBuilder>{
    welcome: (_) => const WelcomeScreen(),
    login: (_) => const AuthScreen(register: false),
    register: (_) => const AuthScreen(register: true),
    dashboard: (_) => const DashboardScreen(),
  };
}
