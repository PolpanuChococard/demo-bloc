import 'package:demo_bloc/core/app_config/app_style.dart';
import 'package:demo_bloc/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class DemoButton extends StatelessWidget {
  const DemoButton({super.key, required this.onPressed, required this.title});
  final VoidCallback onPressed;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyle.appShellPadding,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all(context.theme.primaryColor),
            padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
          ),
          onPressed: onPressed,
          child: DefaultTextStyle.merge(
              style:
                  context.textTheme.titleLarge!.copyWith(color: Colors.white),
              child: title)),
    );
  }
}
