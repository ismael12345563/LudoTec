import 'package:flutter/material.dart';
import '../core/routes/app_routes.dart';
import 'theme/app_theme.dart';

class LudoTecApp extends StatelessWidget {
  const LudoTecApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'LudoTec', debugShowCheckedModeBanner: false,
        theme: AppTheme.light, initialRoute: AppRoutes.welcome,
        routes: AppRoutes.routes,
      );
}
