import 'package:demo_bloc/core/app_config/app_palettes.dart';
import 'package:demo_bloc/core/app_config/app_style.dart';
import 'package:demo_bloc/core/resouces/services_locator/services_locator.dart';
import 'package:demo_bloc/core/utils/navigator_util.dart';
import 'package:demo_bloc/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:demo_bloc/features/authentication/presentation/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<AuthenticationBloc>(),
        )
      ],
      child: GlobalLoaderOverlay(
        child: MaterialApp(
            navigatorKey: NavigatorUtil.navigate,
            title: 'Demo-Bloc',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppPalettes.primary),
              textTheme: AppStyle.primaryTextTheme,
              useMaterial3: true,
            ),
            home: const AuthScreen()),
      ),
    );
  }
}
