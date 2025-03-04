import 'package:flutter/material.dart';
import 'package:japurin/constants/furigana.dart';
import 'package:japurin/enums/furigana_question_type.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/pages/furigana/practice/detailed_settings.dart';
import 'package:japurin/pages/furigana/practice/furigana_practice_page.dart';
import 'package:japurin/pages/furigana/practice/furigana_practice_service.dart';
import 'package:japurin/pages/furigana/practice/kana_type_toggle_buttons.dart';
import 'package:japurin/widgets/labeled_checkbox.dart';
import 'package:ruby_text/ruby_text.dart';

class FuriganaPracticeSettingsPage extends StatefulWidget {
  const FuriganaPracticeSettingsPage({super.key});

  @override
  State<FuriganaPracticeSettingsPage> createState() => _FuriganaPracticeSettingsPageState();
}

class _FuriganaPracticeSettingsPageState extends State<FuriganaPracticeSettingsPage> {
  static final Map<String, Map<String, ValueNotifier<bool>>> _questionRanges = {
    '清音': { for (final key in seion.keys) key: ValueNotifier<bool>(false) },
    '撥音': { hatsuon.romaji: ValueNotifier<bool>(false) },
    '濁音': { for (final key in dakuon.keys) key: ValueNotifier<bool>(false) },
    '半濁音': { for (final key in handakuon.keys) key: ValueNotifier<bool>(false) },
  };

  static final Map<String, ValueNotifier<bool>> _questionTypes = {
    '仮名 → ローマ字': ValueNotifier<bool>(false),
    'ローマ字 → 仮名': ValueNotifier<bool>(false),
    '発音 → 仮名': ValueNotifier<bool>(false),
    '平仮名 ⇄ 片仮名': ValueNotifier<bool>(false),
  };

  static final ValueNotifier<int> _kanaType = ValueNotifier<int>(0);

  static final _detailedSettings = DetailedSettings(
    switchDelay: 0.3,
  );

  static final FuriganaPracticeService _service = FuriganaPracticeService();

  @override
  void initState() {
    super.initState();
    _service.loadPreferences(_questionRanges, _questionTypes, _kanaType, _detailedSettings);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('練習オプション')),
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
                    const Ruby('出題範囲', rubies: ['しゅつ', 'だい', 'はん', 'い']).toRubyList(),
                    textAlign: TextAlign.start,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      _service.setAllRanges(_questionRanges, true);
                    },
                    child: const Text('全選択'),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      _service.setAllRanges(_questionRanges, false);
                    },
                    child: const Text('全解除'),
                  ),
                ],
              ),
              const Divider(),
              ..._questionRanges.entries.expand((entry) {
                return [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(entry.key, style: theme.textTheme.titleMedium),
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
                style: theme.textTheme.titleMedium,
              ),
              const Divider(),
              KanaTypeToggleButtons(kanaType: _kanaType),
              ..._questionTypes.entries.expand((entry) {
                return [
                  LabeledCheckbox(
                    label: entry.key,
                    checkboxValue: entry.value,
                  ),
                ];
              }),
              const SizedBox(height: 15),
              ExpansionTile(
                title: RubyText(Ruby('追加設定', rubies: ['つい', 'か', 'せっ', 'てい']).toRubyList()),
                childrenPadding: EdgeInsets.only(left: 20, top: 20),
                children: [
                  // const Divider(),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('切換題目延遲時間（${_detailedSettings.switchDelay} 秒）'),
                        Slider(
                          value: _detailedSettings.switchDelay,
                          min: 0.0,
                          max: 2.0,
                          divisions: 20,
                          label: _detailedSettings.switchDelay.toStringAsFixed(1),
                          onChanged: (double value) {
                            setState(() {
                              _detailedSettings.switchDelay = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_service.validateQuestionRanges(_questionRanges)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('撥音以外の範囲を選んでください'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      } else if (_service.validateQuestionTypes(_questionTypes)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('問題形式を選んでください'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      } else {
                        await _service.savePreferences(_questionRanges, _questionTypes, _kanaType, _detailedSettings);
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FuriganaPracticePage(
                              questionRanges: [
                                ..._questionRanges.values.expand((group) => group.entries)
                                    .where((kana) => kana.value.value)
                                    .expand((kana) {
                                      return seion[kana.key] ??
                                          dakuon[kana.key] ??
                                          handakuon[kana.key] ??
                                          (kana.key == hatsuon.romaji ? [hatsuon] : []);
                                    }),
                              ],
                              questionTypes: [
                                for (final type in _questionTypes.entries.toList().asMap().entries.where((e) => e.value.value.value))
                                  FuriganaQuestionType.values[type.key],
                              ],
                              kanaType: _kanaType.value,
                              detailedSettings: _detailedSettings,
                            )),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                    ),
                    child: const Text('開始'),
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