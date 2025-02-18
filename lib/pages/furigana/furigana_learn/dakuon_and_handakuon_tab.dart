import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/enums/furigana_type.dart';
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            RubyText(const Ruby('濁音', rubies: ['だく', 'おん']).toRubyList(), style: theme.textTheme.titleMedium),
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
                ...dakuon.entries.map((entry) { 
                  return TableRow(
                    children: [
                      TablePadding(ruby: Ruby('${entry.value.first.getValue(furiganaType)}行'), header: true),
                      ...entry.value.map((kana) => GestureDetector(
                        onTap: () async {
                          await playSound(kana.romaji);
                        },
                        child: TablePadding(ruby: Ruby(kana.getValue(furiganaType)))),
                      ),
                    ]
                  );
                }),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            RubyText(const Ruby('半濁音', rubies: ['はん', 'だく', 'おん']).toRubyList(), style: theme.textTheme.titleMedium),
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
                ...handakuon.entries.map((entry) { 
                  return TableRow(
                    children: [
                      TablePadding(ruby: Ruby('${entry.value.first.getValue(furiganaType)}行'), header: true),
                      ...entry.value.map((kana) => GestureDetector(
                        onTap: () async {
                          await playSound(kana.romaji);
                        },
                        child: TablePadding(ruby: Ruby(kana.getValue(furiganaType)))),
                      ),
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
