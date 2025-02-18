import 'dart:math';

import 'package:flutter/material.dart';
import 'package:japurin/enums/furigana_question_type.dart';
import 'package:japurin/enums/furigana_type.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/models/furigana_question.dart';
import 'package:japurin/utils/preferences_manager.dart';
import 'package:japurin/utils/random_sampler.dart';

class FuriganaPracticeService {
  void setAllRanges(Map<String, Map<String, ValueNotifier<bool>>> ranges, bool value) {
    for (final group in ranges.values) {
      for (final kana in group.values) {
        kana.value = value;
      }
    }
  }

  bool validateQuestionRanges(Map<String, Map<String, ValueNotifier<bool>>> ranges) {
    return ranges.entries
        .where((entry) => entry.key != '撥音')
        .expand((groups) => groups.value.values)
        .every((notifier) => notifier.value == false);
  }

  bool validateQuestionTypes(Map<String, ValueNotifier<bool>> types) {
    return types.values.every((notifier) => notifier.value == false);
  }

  Future<void> loadPreferences(Map<String, Map<String, ValueNotifier<bool>>> ranges, Map<String, ValueNotifier<bool>> types, ValueNotifier<int> kanaType) async {
    List<bool> prefRanges = (await PreferencesManager.loadJson('question_ranges', defaultValue: []) as List).map((e) => e as bool).toList();
    List<bool> prefTypes = (await PreferencesManager.loadJson('question_types', defaultValue: []) as List).map((e) => e as bool).toList();
    final int prefKanaType = await PreferencesManager.load('question_kana_type', defaultValue: 1);

    final int totalRanges = ranges.values.fold(0, (sum, map) => sum + map.length);
    if (prefRanges.length != totalRanges) {
      prefRanges = List.generate(totalRanges, (_) => false);
    }

    if (prefTypes.length != types.length) {
      prefTypes = List.generate(types.length, (_) => false);
    }

    int i = 0;
    for (final group in ranges.keys) {
      for (final key in ranges[group]!.keys) {
        ranges[group]![key]!.value = prefRanges[i++];
      }
    }

    i = 0;
    for (final key in types.keys) {
      types[key]!.value = prefTypes[i++];
    }

    kanaType.value = prefKanaType;
  }

  Future<void> savePreferences(Map<String, Map<String, ValueNotifier<bool>>> ranges, Map<String, ValueNotifier<bool>> types, ValueNotifier<int> kanaType) async {
    await PreferencesManager.saveJson(
      'question_ranges',
      ranges.values
          .expand((map) => map.values)
          .map((notifier) => notifier.value)
          .toList(),
    );
    await PreferencesManager.saveJson(
      'question_types',
      types.values
          .map((notifier) => notifier.value)
          .toList(),
    );
    await PreferencesManager.save('question_kana_type', kanaType.value);
  }

  FuriganaQuestion getRandomQuestion(List<Furigana> ranges, List<FuriganaQuestionType> types, int kanaType) {
    final Furigana question = RandomSampler.sampleOne<Furigana>(ranges);

    final Map<Furigana, int> weights = {for (final kana in ranges) kana: 1};

    // TODO: Modify the weights for specific kata

    final int answerNumber = ranges.length <= 6 ? 3 : 5;
    final List<Furigana> answers = [
      question,
      ...RandomSampler.sampleMultiple<Furigana>(
        ranges.where((e) => e != question).toList(),
        answerNumber,
        weights: weights,
      ),
    ];
    answers.shuffle();

    final FuriganaQuestionType type = types.length == 1 ? types[0] : RandomSampler.sampleOne<FuriganaQuestionType>(types);
    String questionText;
    List<String> answerTexts;
    FuriganaType furiganaType = _getFuriganaType(kanaType);
    switch (type) {
      case FuriganaQuestionType.kanaToRomaji:
        questionText = question.getValue(furiganaType);
        answerTexts = answers.map((answer) => answer.romaji).toList();
        break;
      case FuriganaQuestionType.romajiToKana:
      case FuriganaQuestionType.audioToKana:
        questionText = question.romaji;
        answerTexts = answers.map((answer) => answer.getValue(furiganaType)).toList();
        break;
      case FuriganaQuestionType.kanaSwap:
        questionText = question.getValue(furiganaType);
        FuriganaType oppositeType = (furiganaType == FuriganaType.hiragana) 
          ? FuriganaType.katakana 
          : FuriganaType.hiragana;
        answerTexts = answers.map((answer) => answer.getValue(oppositeType)).toList();
        break;
    }
    return FuriganaQuestion(
      question: questionText,
      answers: answerTexts,
      answerIndex: answers.indexOf(question),
      isAudio: type == FuriganaQuestionType.audioToKana,
    );
  }

  FuriganaType _getFuriganaType(int kanaType) {
    switch (kanaType) {
      case 0:
        return FuriganaType.hiragana;
      case 1:
        return FuriganaType.katakana;
      case 2:
        return Random().nextBool() ? FuriganaType.hiragana : FuriganaType.katakana;
      default:
        throw UnimplementedError('Undefined kana type: $kanaType');
    }
  }
}