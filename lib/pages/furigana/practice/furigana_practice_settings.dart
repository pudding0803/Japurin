import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/pages/furigana/practice/furigana_practice.dart';
import 'package:japurin/widgets/labeled_checkbox.dart';
import 'package:ruby_text/ruby_text.dart';

class FuriganaPracticeSettingsPage extends StatefulWidget {
  const FuriganaPracticeSettingsPage({super.key});

  @override
  State<FuriganaPracticeSettingsPage> createState() => _FuriganaPracticeSettingsPageState();
}

class _FuriganaPracticeSettingsPageState extends State<FuriganaPracticeSettingsPage> {
  final Map<String, Map<String, ValueNotifier<bool>>> questionRanges = {
    '清音': {
      for (final kata in seion.keys) kata.romaji: ValueNotifier<bool>(false),
    },
    '撥音': {
      hatsuon.romaji: ValueNotifier<bool>(false),
    },
    '濁音': {
      for (final kata in dakuon.keys) kata.romaji: ValueNotifier<bool>(false),
    },
    '半濁音': {
      for (final kata in handakuon.keys) kata.romaji: ValueNotifier<bool>(false),
    },
  };

  final Map<String, ValueNotifier<bool>> questionTypes = {
    '仮名 → ローマ字': ValueNotifier<bool>(false),
    'ローマ字 → 仮名': ValueNotifier<bool>(false),
    '音声 → 仮名': ValueNotifier<bool>(false),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('練習オプション')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RubyText(
                    Ruby('出題範囲', rubies: ['しゅつ', 'だい', 'はん', 'い']).toRubyList(),
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      for (final group in questionRanges.values) {
                        for (final kata in group.values) {
                          kata.value = true;
                        }
                      }
                    },
                    child: Text('全選択'),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      for (final group in questionRanges.values) {
                        for (final kata in group.values) {
                          kata.value = false;
                        }
                      }
                    },
                    child: Text('全解除'),
                  ),
                ],
              ),
              const Divider(),
              ...questionRanges.entries.expand((entry) {
                return [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(entry.key, style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Wrap(
                          children: entry.value.keys.map((key) {
                            return LabeledCheckbox(
                              label: key == 'n' ? key : '$key 行',
                              checkboxValue: entry.value[key]!,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ];
              }),
              const SizedBox(height: 10),
              RubyText(
                Ruby('問題の形式', rubies: ['もん', 'だい', null, 'けい', 'しき']).toRubyList(),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(),
              ...questionTypes.entries.expand((entry) {
                return [
                  LabeledCheckbox(
                    label: entry.key,
                    checkboxValue: entry.value,
                  ),
                ];
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FuriganaPracticePage()),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 40),
                    ),
                    child: Text('開始'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}