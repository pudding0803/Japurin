import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/widgets/table_padding.dart';
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
    return BaseTab(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RubyText(const Ruby('促音', rubies: ['そく', 'おん']).toRubyList(), style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(width: 32),
                Text(sokuon.getValue(furiganaType), textAlign: TextAlign.left),
              ],
            ),
            const SizedBox(height: 20),
            RubyText(const Ruby('拗音', rubies: ['よう', 'おん']).toRubyList(), style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            Table(
              border: TableBorder.all(color: Colors.blue),
              defaultVerticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
              columnWidths: {
                for (int i = 0; i < 4; i++) i: const IntrinsicColumnWidth(),
              },
              children: [
                TableRow(
                  children: [
                    TablePadding(ruby: const Ruby(''), header: true),
                    ...header.map((kata) => TablePadding(ruby: Ruby(kata.getValue(furiganaType)), header: true)),
                  ],
                ),
                ...youon.entries.map((entry) { 
                  return TableRow(
                    children: [
                      TablePadding(ruby: Ruby(entry.key.getValue(furiganaType)), header: true),
                      ...entry.value.map((kata) => GestureDetector(
                        onTap: () async {
                          await playSound(kata.romaji);
                        },
                        child: TablePadding(ruby: Ruby(kata.getValue(furiganaType)))),
                      ),
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
