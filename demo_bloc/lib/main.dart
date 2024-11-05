import 'package:demo_bloc/app_config/app_palettes.dart';
import 'package:demo_bloc/app_config/app_style.dart';
import 'package:demo_bloc/core/resouces/services_locator/services_locator.dart';
import 'package:demo_bloc/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo-Bloc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppPalettes.primary),
        textTheme: AppStyle.primaryTextTheme,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
