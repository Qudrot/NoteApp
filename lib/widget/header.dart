import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    this.firstIcon,
    required this.title,
    this.secondIcon,
    this.thirdIcon,
  });

  final String title;
  final IconData? firstIcon;
  final IconData? secondIcon;
  final IconData? thirdIcon;

  @override
  Widget build(BuildContext context) {

    final hasLeading = firstIcon != null;
    return AppBar(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,

      leading: hasLeading? Icon(firstIcon) : null,
      leadingWidth: hasLeading? 40: 0,
      automaticallyImplyLeading: false,

      title: hasLeading? Text(title): Padding(
              padding: const EdgeInsets.only(left: 16), // Adjust this number (0-12) to taste
              child: Text(title),
            ),
      titleSpacing: 0,
      
      actions: [
        if (secondIcon != null) ...[
          Icon(secondIcon),
          const SizedBox(width: 8),
        ],
        if (thirdIcon != null) 
          Icon(thirdIcon),
      ],
      actionsPadding: EdgeInsets.only(right: 16),
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

  //Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  
