import 'package:flutter/material.dart';

class BaseTab extends StatelessWidget {
  final Widget child;

  const BaseTab({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: child,
    );
  }
}