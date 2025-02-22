import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:ruby_text/ruby_text.dart';

class NavigationButton extends StatelessWidget {
  final Ruby ruby;
  final Widget Function() pageBuilder;
  final Size minimumSize;
  final double? borderRadius;

  const NavigationButton({
    super.key,
    required this.ruby,
    required this.pageBuilder,
    required this.minimumSize,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pageBuilder()),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize,
        shape: borderRadius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            )
          : null,
      ),
      child: RubyText(
        ruby.toRubyList(),
        rubyStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
