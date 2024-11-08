import 'package:demo_bloc/features/shares/presentation/widgets/demo_outline_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(
      {super.key, required this.onChanged, required this.formKey});
  final Function(String) onChanged;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return DemoOutlineTextFormField(
      name: 'email',
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'กรุณากรอกอีเมล'),
        FormBuilderValidators.email(errorText: 'รูปแบบอีเมลไม่ถูกต้อง'),
      ]),
      onChanged: onChanged,
      hintText: "อีเมล",
      prefix: const Icon(Icons.email),
    );
  }
}
