import 'package:flutter/material.dart';
import 'package:japurin/constants/suushi.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:japurin/widgets/table_padding.dart';

class KisuushiTab extends StatelessWidget {
  static const header = ['１', '２', '３', '４', '５', '６', '７', '８', '９'];

  const KisuushiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTab(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.all(color: Colors.blue),
              defaultVerticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
              columnWidths: {
                for (int i = 0; i < 11; i++) i: const IntrinsicColumnWidth(),
              },
              children: [
                TableRow(
                  children: [
                    TablePadding(ruby: const Ruby(''), header: true),
                    ...header.map((i) => TablePadding(ruby: Ruby(i), header: true)),
                  ],
                ),
                ...kisuushi.entries.map((entry) { 
                  return TableRow(
                    children: [
                      TablePadding(ruby: entry.key, header: true),
                      ...entry.value.map((ruby) => TablePadding(ruby: ruby)),
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
