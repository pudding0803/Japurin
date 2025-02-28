import 'dart:math';

import 'package:flutter/material.dart';
import 'package:japurin/enums/furigana_question_type.dart';
import 'package:japurin/enums/furigana_type.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/models/furigana_question.dart';
import 'package:japurin/pages/furigana/practice/detailed_settings.dart';
import 'package:japurin/utils/preferences_manager.dart';
import 'package:japurin/utils/random_sampler.dart';

class FuriganaPracticeService {
  void setAllRanges(Map<String, Map<String, ValueNotifier<bool>>> questionRanges, bool value) {
    for (final group in questionRanges.values) {
      for (final kana in group.values) {
        kana.value = value;
      }
    }
  }

  bool validateQuestionRanges(Map<String, Map<String, ValueNotifier<bool>>> questionRanges) {
    return questionRanges.entries
        .where((entry) => entry.key != '撥音')
        .expand((groups) => groups.value.values)
        .every((notifier) => notifier.value == false);
  }

  bool validateQuestionTypes(Map<String, ValueNotifier<bool>> questionTypes) {
    return questionTypes.values.every((notifier) => notifier.value == false);
  }

  Future<void> loadPreferences(
    Map<String, Map<String, ValueNotifier<bool>>> questionRanges,
    Map<String, ValueNotifier<bool>> questionTypes,
    ValueNotifier<int> kanaType,
    DetailedSettings detailedSettings,
  ) async {
    List<bool> prefQuestionRanges = (await PreferencesManager.loadJson('question_ranges', defaultValue: []) as List).map((e) => e as bool).toList();
    List<bool> prefQuestionTypes = (await PreferencesManager.loadJson('question_types', defaultValue: []) as List).map((e) => e as bool).toList();
    final int prefKanaType = await PreferencesManager.load('question_kana_type', defaultValue: kanaType.value);
    DetailedSettings prefDetailedSettings = DetailedSettings.fromJson(await PreferencesManager.loadJson('details', defaultValue: {}));

    final int totalRanges = questionRanges.values.fold(0, (sum, map) => sum + map.length);
    if (prefQuestionRanges.length != totalRanges) {
      prefQuestionRanges = List.generate(totalRanges, (_) => false);
    }

    if (prefQuestionTypes.length != questionTypes.length) {
      prefQuestionTypes = List.generate(questionTypes.length, (_) => false);
    }

    int i = 0;
    for (final group in questionRanges.keys) {
      for (final key in questionRanges[group]!.keys) {
        questionRanges[group]![key]!.value = prefQuestionRanges[i++];
      }
    }

    i = 0;
    for (final key in questionTypes.keys) {
      questionTypes[key]!.value = prefQuestionTypes[i++];
    }

    kanaType.value = prefKanaType;

    detailedSettings = prefDetailedSettings;
  }

  Future<void> savePreferences(
    Map<String, Map<String, ValueNotifier<bool>>> questionRanges,
    Map<String, ValueNotifier<bool>> questionTypes,
    ValueNotifier<int> kanaType,
    DetailedSettings detailedSettings,
  ) async {
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
    await PreferencesManager.save('question_kana_type', kanaType.value);
    await PreferencesManager.saveJson('detailedSettings', detailedSettings.toJson());
  }

  FuriganaQuestion getRandomQuestion(List<Furigana> questionRanges, List<FuriganaQuestionType> questionTypes, int kanaType) {
    final Furigana question = RandomSampler.sampleOne<Furigana>(questionRanges);

    final Map<Furigana, int> weights = {for (final kana in questionRanges) kana: 1};

    // TODO: Modify the weights for specific kata

    final int answerNumber = questionRanges.length <= 6 ? 3 : 5;
    final List<Furigana> answers = [
      question,
      ...RandomSampler.sampleMultiple<Furigana>(
        questionRanges.where((e) => e != question).toList(),
        answerNumber,
        weights: weights,
      ),
    ];
    answers.shuffle();

    final FuriganaQuestionType type = questionTypes.length == 1 ? questionTypes[0] : RandomSampler.sampleOne<FuriganaQuestionType>(questionTypes);
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