import 'package:flutter/material.dart';

class ClickArea extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const ClickArea({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTap,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: child,
    );
  }
}
