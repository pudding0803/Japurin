import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/pages/furigana/practice/furigana_practice.dart';
import 'package:japurin/utils/preferences_manager.dart';
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

  Future<void> _loadPreferences() async {
    List<bool> prefRanges = (await PreferencesManager.loadJson('question_ranges', defaultValue: []) as List).map((e) => e as bool).toList();
    List<bool> prefTypes = (await PreferencesManager.loadJson('question_types', defaultValue: []) as List).map((e) => e as bool).toList();

    int totalRanges = questionRanges.values.fold(0, (sum, map) => sum + map.length);
    if (prefRanges.length != totalRanges) {
      prefRanges = List.generate(totalRanges, (_) => false);
    }

    if (prefTypes.length != questionTypes.length) {
      prefTypes = List.generate(questionTypes.length, (_) => false);
    }

    int i = 0;
    for (final group in questionRanges.keys) {
      for (final key in questionRanges[group]!.keys) {
        questionRanges[group]![key]!.value = prefRanges[i++];
      }
    }

    i = 0;
    for (final key in questionTypes.keys) {
      questionTypes[key]!.value = prefTypes[i++];
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

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
                Ruby('問題形式', rubies: ['もん', 'だい', 'けい', 'しき']).toRubyList(),
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
                    onPressed: () async {
                      if (questionRanges.entries
                          .where((entry) => entry.key != '撥音')
                          .expand((groups) => groups.value.values)
                          .every((notifier) => notifier.value == false)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('撥音以外の範囲を選んでください'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else if (questionTypes.values.every((notifier) => notifier.value == false)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('問題形式を選んでください'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        await PreferencesManager.saveJson(
                          'question_ranges',
                          questionRanges.values
                              .expand((map) => map.values)
                              .map((notifier) => notifier.value)
                              .toList(),
                        );
                        await PreferencesManager.saveJson(
                          'question_types',
                          questionTypes.values
                              .map((notifier) => notifier.value)
                              .toList(),
                        );
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FuriganaPracticePage()),
                          );
                        }
                      }
                    },
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