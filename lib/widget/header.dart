import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    this.firstIcon,
    required this.title,
    this.secondIcon,
    this.thirdIcon,
    this.onFirstIconTap,
    this.onSecondIconTap,
    this.onThirdIconTap,
  });

  final String title;
  final IconData? firstIcon;
  final IconData? secondIcon;
  final IconData? thirdIcon;
  
  final VoidCallback? onFirstIconTap;
  final VoidCallback? onSecondIconTap;
  final VoidCallback? onThirdIconTap;

  @override
  Widget build(BuildContext context) {
    final hasLeading = firstIcon != null;
    return AppBar(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,

      leading: hasLeading 
          ? IconButton(
              icon: Icon(firstIcon),
              onPressed: onFirstIconTap,
            ) 
          : null,
      leadingWidth: hasLeading ? 40 : 0,
      automaticallyImplyLeading: false,

      title: hasLeading
          ? Text(title)
          : Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(title),
            ),
      titleSpacing: 0,

      actions: [
        if (secondIcon != null) ...[
          IconButton(
            icon: Icon(secondIcon),
            onPressed: onSecondIconTap,
          ),
          const SizedBox(width: 8),
        ],
        if (thirdIcon != null)
          IconButton(
            icon: Icon(thirdIcon),
            onPressed: onThirdIconTap,
          ),
      ],
      actionsPadding: const EdgeInsets.only(right: 8),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}