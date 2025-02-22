import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/widgets/navigation_button.dart';

class FuriganaNavigationButton extends StatelessWidget {
  final Ruby ruby;
  final Widget Function() pageBuilder;

  const FuriganaNavigationButton({
    super.key,
    required this.ruby,
    required this.pageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationButton(ruby: ruby, pageBuilder: pageBuilder, minimumSize: const Size(120, 100), borderRadius: 30);
  }
}
