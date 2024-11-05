import 'package:demo_bloc/app_config/app_palettes.dart';
import 'package:flutter/material.dart';

class DemoOutlineTextFormField extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? style;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final bool enabled;
  final bool obscureText;
  final int? maxLines;

  const DemoOutlineTextFormField(
      {super.key,
      this.style,
      this.hintText,
      this.initialValue,
      this.prefix,
      this.suffix,
      this.controller,
      this.validator,
      this.borderRadius,
      this.fillColor,
      this.onTap,
      this.onChanged,
      this.obscureText = false,
      this.enabled = true,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      enabled: enabled,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLines: maxLines,
      style: style,
      onTap: () => onTap?.call(),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIconColor: WidgetStateColor.resolveWith((states) =>
            states.contains(WidgetState.focused)
                ? AppPalettes.primary
                : Colors.grey),
        suffixIconColor: WidgetStateColor.resolveWith((states) =>
            states.contains(WidgetState.focused)
                ? AppPalettes.primary
                : Colors.grey),
        prefixIcon: prefix,
        suffixIcon: suffix,
        fillColor: fillColor ?? Colors.grey.withOpacity(0.15),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: AppPalettes.primary,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: AppPalettes.primary,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
