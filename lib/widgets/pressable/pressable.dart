import 'package:flutter/material.dart';

class Pressable extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  Pressable({@required this.child, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: child),
    );
  }
}
