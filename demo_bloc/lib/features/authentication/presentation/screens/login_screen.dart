import 'package:demo_bloc/features/shares/presentation/widgets/demo_app_bar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppBar(title: 'Login'),
    );
  }
}
