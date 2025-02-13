import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:ruby_text/ruby_text.dart';

class NavigationButton extends StatelessWidget {
  final Ruby ruby;
  final Widget page;

  const NavigationButton({
    super.key,
    required this.ruby,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(140, 60),
      ),
      child: RubyText(
        ruby.toRubyList(),
        style: TextStyle(fontSize: 14),
        rubyStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
