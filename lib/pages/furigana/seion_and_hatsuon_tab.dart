import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/pages/furigana/furigana_base_tab.dart';
import 'package:japurin/utils/ruby.dart';
import 'package:japurin/pages/furigana/table_padding.dart';
import 'package:ruby_text/ruby_text.dart';

class SeionAndHatsuonTab extends StatelessWidget {
  static const header = [
    Furigana('あ', 'ア', 'a'),
    Furigana('い', 'イ', 'i'),
    Furigana('う', 'ウ', 'u'),
    Furigana('え', 'エ', 'e'),
    Furigana('お', 'オ', 'o'),
  ];

  final FuriganaType furiganaType;

  const SeionAndHatsuonTab({super.key, required this.furiganaType});

  @override
  Widget build(BuildContext context) {
    return FuriganaBaseTab(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RubyText(Ruby('清音', ['せい', 'おん']).toRubyList(), style: Theme.of(context).textTheme.titleMedium),
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
                    ...seion.entries.map((entry) { 
                      return TableRow(
                        children: [
                          TablePadding(text: '${entry.value[0].getValue(furiganaType)}行', header: true),
                          ...(() {
                            final List<String> contents = List.filled(5, ' ');

                            if (entry.key == 'ya') {
                              contents[0] = entry.value[0].getValue(furiganaType);
                              contents[2] = entry.value[1].getValue(furiganaType);
                              contents[4] = entry.value[2].getValue(furiganaType);
                            } else if (entry.key == 'wa') {
                              contents[0] = entry.value[0].getValue(furiganaType);
                              contents[4] = entry.value[1].getValue(furiganaType);
                            } else {
                              for (int i = 0; i < 5; i++) {
                                contents[i] = entry.value[i].getValue(furiganaType);
                              }
                            }

                            return List.generate(5, (i) => TablePadding(text: contents[i]));
                          })(),
                        ],
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RubyText(Ruby('撥音', ['はつ', 'おん']).toRubyList(), style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 28),
              Expanded(
                child: Text(hatsuon.getValue(furiganaType), textAlign: TextAlign.left),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
