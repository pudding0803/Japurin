import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/widgets/table_padding.dart';
import 'package:ruby_text/ruby_text.dart';

class DakuonAndHandakuonTab extends StatelessWidget {
  static const header = [
    Furigana('あ', 'ア', 'a'),
    Furigana('い', 'イ', 'i'),
    Furigana('う', 'ウ', 'u'),
    Furigana('え', 'エ', 'e'),
    Furigana('お', 'オ', 'o'),
  ];
  
  final FuriganaType furiganaType;

  const DakuonAndHandakuonTab({super.key, required this.furiganaType});

  @override
  Widget build(BuildContext context) {
    return BaseTab(
      child: Column(
        children: [
          RubyText(const Ruby('濁音', ['だく', 'おん']).toRubyList(), style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Table(
            border: TableBorder.all(color: Colors.blue),
            defaultVerticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
            columnWidths: {
              for (int i = 0; i < 6; i++) i: const IntrinsicColumnWidth(),
            },
            children: [
              TableRow(
                children: [
                  TablePadding(ruby: const Ruby(''), header: true),
                  ...header.map((kata) => TablePadding(ruby: Ruby('${kata.getValue(furiganaType)}段'), header: true)),
                ],
              ),
              ...dakuon.entries.map((entry) { 
                return TableRow(
                  children: [
                    TablePadding(ruby: Ruby('${entry.key.getValue(furiganaType)}行'), header: true),
                    ...entry.value.map((kata) => TablePadding(ruby: Ruby(kata.getValue(furiganaType)))),
                  ]
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
          RubyText(const Ruby('半濁音', ['はん', 'だく', 'おん']).toRubyList(), style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Table(
            border: TableBorder.all(color: Colors.blue),
            defaultVerticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
            columnWidths: {
              for (int i = 0; i < 6; i++) i: const IntrinsicColumnWidth(),
            },
            children: [
              TableRow(
                children: [
                  TablePadding(ruby: const Ruby(''), header: true),
                  ...header.map((kata) => TablePadding(ruby: Ruby('${kata.getValue(furiganaType)}段'), header: true)),
                ],
              ),
              ...handakuon.entries.map((entry) { 
                return TableRow(
                  children: [
                    TablePadding(ruby: Ruby('${entry.key.getValue(furiganaType)}行'), header: true),
                    ...entry.value.map((kata) => TablePadding(ruby: Ruby(kata.getValue(furiganaType)))),
                  ]
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
