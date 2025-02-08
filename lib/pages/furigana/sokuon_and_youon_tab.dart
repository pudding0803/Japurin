import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/pages/furigana/furigana_base_tab.dart';
import 'package:japurin/utils/ruby.dart';
import 'package:japurin/pages/furigana/table_padding.dart';
import 'package:ruby_text/ruby_text.dart';

class SokuonAndYouonTab extends StatelessWidget {

  static const header = [
    Furigana('ゃ', 'ャ', 'ya'),
    Furigana('ゅ', 'ュ', 'yu'),
    Furigana('ょ', 'ョ', 'yo'),
  ];

  final FuriganaType furiganaType;

  const SokuonAndYouonTab({super.key, required this.furiganaType});

  @override
  Widget build(BuildContext context) {
    return FuriganaBaseTab(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RubyText(Ruby('促音', ['そく', 'おん']).toRubyList(), style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 28),
              Expanded(
                child: Text(sokuon.getValue(furiganaType), textAlign: TextAlign.left),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RubyText(Ruby('拗音', ['よう', 'おん']).toRubyList(), style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 28),
              Expanded(
                child: Table(
                  border: TableBorder.all(color: Colors.blue),
                  children: [
                    TableRow(
                      children: [
                        TablePadding(text: '', header: true),
                        ...header.map((kata) => TablePadding(text: kata.getValue(furiganaType), header: true)),
                      ],
                    ),
                    ...youon.entries.map((entry) { 
                      return TableRow(
                        children: [
                          TablePadding(text: '${entry.value[0].getValue(furiganaType)[0]}${furiganaType == FuriganaType.romaji ? 'i' : ''}', header: true),
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
