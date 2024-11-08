import 'package:demo_bloc/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class DemoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DemoAppBar(
      {super.key,
      this.title,
      this.actions,
      this.centerTitle = true,
      this.hasLeading = true});

  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool hasLeading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: (title == null)
          ? null
          : DefaultTextStyle.merge(
              style:
                  context.textTheme.titleLarge!.copyWith(color: Colors.white),
              child: title!),
      centerTitle: centerTitle,
      actions: actions,
      scrolledUnderElevation: 0.0,
      backgroundColor: context.theme.colorScheme.primary,
      automaticallyImplyLeading: hasLeading,
    );
  }
}
