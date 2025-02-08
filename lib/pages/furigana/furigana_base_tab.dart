import 'package:flutter/material.dart';

class FuriganaBaseTab extends StatelessWidget {
  final Widget child;

  const FuriganaBaseTab({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth * 0.8;
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40), 
            child: Center(
              child: SizedBox(
                width: maxWidth,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
