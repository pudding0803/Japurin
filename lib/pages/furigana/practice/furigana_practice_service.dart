import 'dart:math';

import 'package:flutter/material.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/models/furigana_question.dart';
import 'package:japurin/utils/preferences_manager.dart';
import 'package:japurin/utils/random_sampler.dart';

class FuriganaPracticeService {
  void setAllRanges(Map<String, Map<String, ValueNotifier<bool>>> ranges, bool value) {
    for (final group in ranges.values) {
      for (final kata in group.values) {
        kata.value = value;
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

  Future<void> loadPreferences(Map<String, Map<String, ValueNotifier<bool>>> ranges, Map<String, ValueNotifier<bool>> types, ValueNotifier<int> kataType) async {
    List<bool> prefRanges = (await PreferencesManager.loadJson('question_ranges', defaultValue: []) as List).map((e) => e as bool).toList();
    List<bool> prefTypes = (await PreferencesManager.loadJson('question_types', defaultValue: []) as List).map((e) => e as bool).toList();
    final int prefKataType = await PreferencesManager.load('question_kata_type', defaultValue: 1);

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

    kataType.value = prefKataType;
  }

  Future<void> savePreferences(Map<String, Map<String, ValueNotifier<bool>>> ranges, Map<String, ValueNotifier<bool>> types, ValueNotifier<int> kataType) async {
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
    await PreferencesManager.save('question_kata_type', kataType.value);
  }

  FuriganaQuestion getRandomQuestion(List<Furigana> ranges, List<int> types, int kataType) {
    final Furigana question = RandomSampler.sampleOne<Furigana>(ranges);

    final Map<Furigana, int> weights = {for (final kata in ranges) kata: 1};

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

    final int type = types.length == 1 ? types[0] : RandomSampler.sampleOne<int>(types);
    String questionText;
    List<String> answerTexts;
    FuriganaType? furiganaType = _getFuriganaType(kataType);
    switch (type) {
      case 0:
        questionText = _getFuriganaString(question, furiganaType);
        answerTexts = answers.map((answer) => answer.romaji).toList();
        break;
      case 1:
      case 2:
        questionText = question.romaji;
        answerTexts = answers.map((answer) => _getFuriganaString(answer, furiganaType)).toList();
        break;
      default:
        throw UnimplementedError('Undefined question type: $type');
    }
    return FuriganaQuestion(
      question: questionText,
      answers: answerTexts,
      answerIndex: answers.indexOf(question),
      isAudio: type == 2,
    );
  }

  FuriganaType? _getFuriganaType(int kataType) {
    switch (kataType) {
      case 0:
        return FuriganaType.hiragana;
      case 1:
        return FuriganaType.katakana;
      case 2:
        return Random().nextBool() ? FuriganaType.hiragana : FuriganaType.katakana;
      case 3:
        return null;
      default:
        throw UnimplementedError('Undefined kata type: $kataType');
    }
  }

  String _getFuriganaString(Furigana furigana, FuriganaType? furiganaType) {
    return furiganaType != null
      ? furigana.getValue(furiganaType)
      : (Random().nextBool() ? furigana.hiragana : furigana.katakana);
  }
}