import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/pages/furigana/furigana_base_tab.dart';
import 'package:japurin/utils/ruby.dart';
import 'package:japurin/pages/furigana/table_padding.dart';
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
    return FuriganaBaseTab(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RubyText(Ruby('濁音', ['だく', 'おん']).toRubyList(), style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 28),
              Expanded(
                child: Table(
                  border: TableBorder.all(color: Colors.blue),
                  children: [
                    TableRow(
                      children: [
                        TablePadding(text: '', header: true),
                        ...header.map((kata) => TablePadding(text: '${kata.getValue(furiganaType)}段', header: true)),
                      ],
                    ),
                    ...dakuon.entries.map((entry) { 
                      return TableRow(
                        children: [
                          TablePadding(text: '${entry.value[0].getValue(furiganaType)}行', header: true),
                          ...entry.value.map((kata) => TablePadding(text: kata.getValue(furiganaType))),
                        ]
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              RubyText(Ruby('半濁音', ['はん', 'だく', 'おん']).toRubyList(), style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 28),
              Expanded(
                child: Table(
                  border: TableBorder.all(color: Colors.blue),
                  children: [
                    TableRow(
                      children: [
                        TablePadding(text: '', header: true),
                        ...header.map((kata) => TablePadding(text: '${kata.getValue(furiganaType)}段', header: true)),
                      ],
                    ),
                    ...handakuon.entries.map((entry) { 
                      return TableRow(
                        children: [
                          TablePadding(text: '${entry.value[0].getValue(furiganaType)}行', header: true),
                          ...entry.value.map((kata) => TablePadding(text: kata.getValue(furiganaType))),
                        ]
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
