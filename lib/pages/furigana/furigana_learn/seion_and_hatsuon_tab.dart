import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/enums/furigana_type.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/pages/furigana/furigana_learn/kana_button.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:japurin/models/ruby.dart';
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

  final Function(String) playSound;

  const SeionAndHatsuonTab({
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
            RubyText(const Ruby('清音', rubies: ['せい', 'おん']).toRubyList(), style: theme.textTheme.titleMedium),
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
                ...seion.values.map((row) { 
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text('${row.first.getValue(furiganaType)}行'),
                      ),
                      ...(() {
                        final List<Furigana> cells = List.filled(5, const Furigana('', '', ''));

                        if (row.length == 3) {
                          cells[0] = row[0];
                          cells[2] = row[1];
                          cells[4] = row[2];
                        } else if (row.length == 2) {
                          cells[0] = row[0];
                          cells[4] = row[1];
                        } else {
                          for (int i = 0; i < 5; i++) {
                            cells[i] = row[i];
                          }
                        }

                        return List.generate(5, (i) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: cells[i].romaji.isEmpty
                              ? const Text('')
                              : KanaButton(
                                  onPressed: () async { await playSound(cells[i].romaji); },
                                  text: cells[i].getValue(furiganaType),
                                ),
                          );
                        });
                      })(),
                    ],
                  );
                }),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RubyText(const Ruby('撥音', rubies: ['はつ', 'おん']).toRubyList(), style: theme.textTheme.titleMedium),
                const SizedBox(width: 32),
                KanaButton(
                  onPressed: () async { await playSound(hatsuon.romaji); },
                  text: hatsuon.getValue(furiganaType),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
