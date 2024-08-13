import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final VoidCallback? onTap;

  const ProfileAvatar({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
        ));
  }
}
