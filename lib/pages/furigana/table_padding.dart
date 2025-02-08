import 'package:flutter/material.dart';

class TablePadding extends StatelessWidget {
  final String text;
  final bool header;

  const TablePadding({
    super.key,
    required this.text,
    this.header = false,
  });

  @override
  Widget build(BuildContext context) {
    return header
      ? Container(
          color: Colors.tealAccent,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      : Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        );
  }
}
