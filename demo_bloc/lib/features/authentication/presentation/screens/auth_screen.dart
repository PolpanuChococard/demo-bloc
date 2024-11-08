import 'package:demo_bloc/core/enums/auth_status.dart';
import 'package:demo_bloc/core/enums/state_status.dart';
import 'package:demo_bloc/core/utils/navigator_util.dart';
import 'package:demo_bloc/features/authentication/presentation/%E0%B8%B4bloc/authentication_bloc/authentication_bloc.dart';
import 'package:demo_bloc/features/authentication/presentation/screens/login_screen.dart';
import 'package:demo_bloc/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    context.read<AuthenticationBloc>().add(GetCurrentAuthUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        //handle loader
        if (state.stateStatus.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        //handle auth status
        if (state.authStatus.isUnAuthorized && !state.stateStatus.isLoading) {
          NavigatorUtil.popToFirst();
          NavigatorUtil.pushToPage(LoginScreen());
        }

        if (state.authStatus.isAuthorized && !state.stateStatus.isLoading) {
          NavigatorUtil.pushToPage(const HomeScreen());
        }
      },
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
