import 'package:flutter/material.dart';
import 'package:kgbm_redesign/theme/app_theme.dart';
import 'package:kgbm_redesign/screens/home_screen.dart';

void main() {
  runApp(const KGBMApp());
}

class KGBMApp extends StatelessWidget {
  const KGBMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KG Business Management',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
