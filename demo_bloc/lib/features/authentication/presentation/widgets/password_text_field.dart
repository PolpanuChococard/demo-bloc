import 'package:demo_bloc/features/shares/domain/entities/response/password_entity.dart';
import 'package:demo_bloc/features/shares/presentation/widgets/demo_outline_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {super.key,
      required this.initialValue,
      required this.onChanged,
      required this.formKey});
  final PasswordEntity initialValue;
  final Function(PasswordEntity) onChanged;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return DemoOutlineTextFormField(
      name: 'password',
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'กรุณากรอกรหัสผ่าน'),
        FormBuilderValidators.equalLength(8, errorText: 'รหัสผ่านต้องมี 8 ตัว'),
      ]),
      onChanged: (value) => onChanged(initialValue.copyWith(value: value)),
      hintText: "รหัสผ่าน",
      prefix: const Icon(Icons.lock),
      suffix: IconButton(
          onPressed: () => onChanged(
              initialValue.copyWith(isObsecure: !initialValue.isObsecure)),
          icon: const Icon(Icons.remove_red_eye)),
      obscureText: initialValue.isObsecure,
    );
  }
}
