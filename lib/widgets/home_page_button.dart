import 'package:flutter/material.dart';
import 'package:japurin/utils/ruby.dart';
import 'package:ruby_text/ruby_text.dart';

class HomePageButton extends StatelessWidget {
  final Ruby ruby;
  final String page;

  const HomePageButton({
    super.key,
    required this.ruby,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, page),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(120, 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: RubyText(
        ruby.toRubyList(),
        style: TextStyle(fontSize: 16),
        rubyStyle: TextStyle(fontSize: 10, color: Colors.grey),
      ),
    );
  }
}
