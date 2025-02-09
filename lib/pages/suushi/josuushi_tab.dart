import 'package:flutter/material.dart';
import 'package:japurin/constants/suushi.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:japurin/widgets/table_padding.dart';

class JosuushiTab extends StatelessWidget {
  static const header = ['１', '２', '３', '４', '５', '６', '７', '８', '９', '１０', '？'];
  
  const JosuushiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTab(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Table(
                border: TableBorder.all(color: Colors.blue),
                defaultVerticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
                columnWidths: {
                  for (int i = 0; i < 13; i++) i: const IntrinsicColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      TablePadding(ruby: const Ruby(''), header: true),
                      ...header.map((i) => TablePadding(ruby: Ruby(i), header: true)),
                    ],
                  ),
                  ...josuushi.entries.map((entry) { 
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
      ),
    );
  }
}