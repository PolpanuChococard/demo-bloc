import 'package:flutter/material.dart';

class DemoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DemoAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle = true,
  });

  final String? title;
  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: (title == null) ? null : Text(title!),
      centerTitle: centerTitle,
      actions: actions,
      scrolledUnderElevation: 0.0,
    );
  }
}
