import 'package:demo_bloc/core/extensions/context_extension.dart';
import 'package:demo_bloc/core/utils/dialog_util.dart';
import 'package:demo_bloc/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoDrawer extends StatelessWidget {
  const DemoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: context.theme.colorScheme.primary),
            child: Text(
              'Demo-Bloc App',
              style:
                  context.textTheme.titleLarge!.copyWith(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle navigation to Home screen
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Mock Drawer Menu'),
            onTap: () {
              // Handle navigation to Profile screen
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Mock Drawer Menu'),
            onTap: () {
              // Handle navigation to Profile screen
              Navigator.pop(context); // Close the drawer
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              // Handle logout action
              bool? shouldLogout = await DialogUtil.showConfirmDialog(
                context: context,
                title: 'Confirm Logout',
                content: 'Are you sure you want to log out?',
              );

              if (shouldLogout && context.mounted) {
                context.read<AuthenticationBloc>().add(LogOutEvent());
              }
            },
          ),
        ],
      ),
    );
  }
}
