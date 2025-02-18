import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/enums/furigana_type.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/widgets/table_padding.dart';
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            RubyText(const Ruby('清音', rubies: ['せい', 'おん']).toRubyList(), style: theme.textTheme.titleMedium),
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
                    ...header.map((kana) => TablePadding(ruby: Ruby('${kana.getValue(furiganaType)}段'), header: true)),
                  ],
                ),
                ...seion.entries.map((entry) { 
                  return TableRow(
                    children: [
                      TablePadding(ruby: Ruby('${entry.value.first.getValue(furiganaType)}行'), header: true),
                      ...(() {
                        final List<Furigana> cells = List.filled(5, const Furigana('', '', ''));

                        if (entry.value.length == 3) {
                          cells[0] = entry.value[0];
                          cells[2] = entry.value[1];
                          cells[4] = entry.value[2];
                        } else if (entry.value.length == 2) {
                          cells[0] = entry.value[0];
                          cells[4] = entry.value[1];
                        } else {
                          for (int i = 0; i < 5; i++) {
                            cells[i] = entry.value[i];
                          }
                        }

                        return List.generate(5, (i) {
                          final ruby = Ruby(cells[i].getValue(furiganaType));

                          return cells[i].romaji.isEmpty
                              ? TablePadding(ruby: ruby)
                              : GestureDetector(
                                  onTap: () async => await playSound(cells[i].romaji),
                                  child: TablePadding(ruby: ruby),
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
                GestureDetector(
                  onTap: () async {
                    await playSound(hatsuon.romaji);
                  },
                  child: Text(hatsuon.getValue(furiganaType), textAlign: TextAlign.left),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
