import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/enums/furigana_type.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/pages/furigana/furigana_learn/kana_button.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:japurin/models/ruby.dart';
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

  final Function(String) playSound;

  const DakuonAndHandakuonTab({
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
            RubyText(const Ruby('濁音', rubies: ['だく', 'おん']).toRubyList(), style: theme.textTheme.titleMedium),
            const SizedBox(height: 20),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                for (int i = 0; i < 6; i++) i: const IntrinsicColumnWidth(),
              },
              children: [
                TableRow(
                  children: [
                    const Text(''),
                    ...header.map((kana) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('${kana.getValue(furiganaType)}段', textAlign: TextAlign.center)),
                    ),
                  ],
                ),
                ...dakuon.entries.map((entry) { 
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text('${entry.value.first.getValue(furiganaType)}行'),
                      ),
                      ...entry.value.map((kana) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: KanaButton(
                          onPressed: () async { await playSound(kana.romaji); },
                          text: kana.getValue(furiganaType),
                        ),
                      )),
                    ]
                  );
                }),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            RubyText(const Ruby('半濁音', rubies: ['はん', 'だく', 'おん']).toRubyList(), style: theme.textTheme.titleMedium),
            const SizedBox(height: 20),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                for (int i = 0; i < 6; i++) i: const IntrinsicColumnWidth(),
              },
              children: [
                TableRow(
                  children: [
                    const Text(''),
                    ...header.map((kana) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('${kana.getValue(furiganaType)}段', textAlign: TextAlign.center),
                    )),
                  ],
                ),
                ...handakuon.entries.map((entry) { 
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text('${entry.value.first.getValue(furiganaType)}行'),
                      ),
                      ...entry.value.map((kana) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: KanaButton(
                          onPressed: () async { await playSound(kana.romaji); },
                          text: kana.getValue(furiganaType),
                        ),
                      )),
                    ]
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
