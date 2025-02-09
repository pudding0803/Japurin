import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:ruby_text/ruby_text.dart';

class TablePadding extends StatelessWidget {
  final Ruby ruby;
  final bool header;

  const TablePadding({
    super.key,
    required this.ruby,
    this.header = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: header ? Colors.tealAccent : Colors.transparent,
      alignment: Alignment.center,
      child: RubyText(
        ruby.toRubyList(),
        style: TextStyle(
          color: ruby.color,
          fontWeight: header || ruby.bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}