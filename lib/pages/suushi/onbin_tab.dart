import 'package:flutter/material.dart';
import 'package:japurin/constants/suushi.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:japurin/widgets/table_padding.dart';

class OnbinTab extends StatelessWidget {
  static const header = ['１', '３', '６', '８', '１０', '？'];

  const OnbinTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTab(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              border: TableBorder.all(color: Colors.blue),
              defaultVerticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
              children: [
                TableRow(
                  children: [
                    TablePadding(ruby: const Ruby(''), header: true),
                    ...header.map((i) => TablePadding(ruby: Ruby(i), header: true)),
                  ],
                ),
                ...onbin.entries.map((entry) { 
                  return TableRow(
                    children: [
                      TablePadding(ruby: entry.key, header: true),
                      ...entry.value.map((text) => TablePadding(ruby: Ruby(text))),
                    ],
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
