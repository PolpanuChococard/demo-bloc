import 'package:demo_bloc/core/app_config/app_style.dart';
import 'package:flutter/material.dart';

class DemoBodyShell extends StatelessWidget {
  const DemoBodyShell({super.key, required this.childs});
  final List<Widget> childs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyle.appShellPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [...childs],
        ),
      ),
    );
  }
}
