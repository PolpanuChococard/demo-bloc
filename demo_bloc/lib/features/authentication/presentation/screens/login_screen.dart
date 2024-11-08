import 'package:demo_bloc/core/app_config/app_style.dart';
import 'package:demo_bloc/core/enums/auth_status.dart';
import 'package:demo_bloc/core/resouces/services_locator/services_locator.dart';
import 'package:demo_bloc/features/authentication/presentation/%E0%B8%B4bloc/authentication_bloc/authentication_bloc.dart';
import 'package:demo_bloc/features/authentication/presentation/%E0%B8%B4bloc/login_bloc/login_bloc.dart';
import 'package:demo_bloc/features/authentication/presentation/widgets/email_text_field.dart';
import 'package:demo_bloc/features/authentication/presentation/widgets/password_text_field.dart';
import 'package:demo_bloc/features/shares/presentation/widgets/demo_app_bar.dart';
import 'package:demo_bloc/features/shares/presentation/widgets/demo_body_shell.dart';
import 'package:demo_bloc/features/shares/presentation/widgets/demo_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  LoginBloc get providedBloc => getIt.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormBuilderState>();

    return BlocProvider(
      create: (context) => providedBloc,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, authState) {
          if (authState.authStatus.isAuthorized) {
            context.read<LoginBloc>().add(ClearLoginEvent());
            formkey.currentState!.reset();
          }
        },
        child: PopScope(
          canPop: false,
          child: Scaffold(
              appBar: const DemoAppBar(title: Text('Login'), hasLeading: false),
              body: FormBuilder(
                  key: formkey,
                  child: DemoBodyShell(childs: [
                    _EmailField(formKey: formkey),
                    const SizedBox(height: AppStyle.verticalSeperator),
                    _PasswordField(formKey: formkey)
                  ])),
              bottomNavigationBar: _LoginButton(formKey: formkey)),
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({required this.formKey});
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return EmailTextField(
              formKey: formKey,
              onChanged: (value) => bloc.add(EmailChangedEvent(email: value)));
        });
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({required this.formKey});
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return PasswordTextField(
              formKey: formKey,
              initialValue: state.password,
              onChanged: (password) =>
                  bloc.add(PasswordChangedEvent(password: password)));
        });
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.formKey});
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();

    return DemoButton(
        onPressed: () {
          if (!formKey.currentState!.validate()) return;
          authBloc.add(LoginAttemptedEvent());
        },
        title: const Text("Login"));
  }
}
