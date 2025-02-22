import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/enums/furigana_type.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/pages/furigana/furigana_learn/kana_button.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:japurin/models/ruby.dart';
import 'package:ruby_text/ruby_text.dart';

class SokuonAndYouonTab extends StatelessWidget {
  static const header = [
    Furigana('ゃ', 'ャ', 'ya'),
    Furigana('ゅ', 'ュ', 'yu'),
    Furigana('ょ', 'ョ', 'yo'),
  ];

  final FuriganaType furiganaType;

  final Function(String) playSound;

  const SokuonAndYouonTab({
    super.key,
    required this.furiganaType,
    required this.playSound,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseTab(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RubyText(const Ruby('促音', rubies: ['そく', 'おん']).toRubyList(), style: theme.textTheme.titleMedium),
                const SizedBox(width: 32),
                Text(sokuon.getValue(furiganaType), textAlign: TextAlign.left),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            RubyText(const Ruby('拗音', rubies: ['よう', 'おん']).toRubyList(), style: theme.textTheme.titleMedium),
            const SizedBox(height: 20),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                for (int i = 0; i < 4; i++) i: const IntrinsicColumnWidth(),
              },
              children: [
                TableRow(
                  children: [
                    const Text(''),
                    ...header.map((kana) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(kana.getValue(furiganaType), textAlign: TextAlign.center),
                    )),
                  ],
                ),
                ...youon.entries.map((entry) { 
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(entry.key.getValue(furiganaType)),
                      ),
                      ...entry.value.map((kana) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: KanaButton(
                          onPressed: () async { await playSound(kana.romaji); },
                          text: kana.getValue(furiganaType),
                        ),
                      )),
                    ],//furiganaType == FuriganaType.romaji
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
