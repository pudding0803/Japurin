import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:japurin/enums/furigana_question_type.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/models/furigana_question.dart';
import 'package:japurin/pages/furigana/practice/answer_button.dart';
import 'package:japurin/pages/furigana/practice/detailed_settings.dart';
import 'package:japurin/pages/furigana/practice/furigana_practice_service.dart';

class FuriganaPracticePage extends StatefulWidget {
  final List<Furigana> questionRanges;
  final List<FuriganaQuestionType> questionTypes;
  final int kanaType;
  final DetailedSettings detailedSettings;
  
  const FuriganaPracticePage({
    super.key,
    required this.questionRanges,
    required this.questionTypes,
    required this.kanaType,
    required this.detailedSettings,
  });

  @override
  State<FuriganaPracticePage> createState() => _FuriganaPracticePageState();
}

class _FuriganaPracticePageState extends State<FuriganaPracticePage> {
  static final _service = FuriganaPracticeService();

  static late FuriganaQuestion _furiganaQuestion;

  static late List<bool> _disabled;
  
  late final int _switchDelayMs;

  final _audioPlayer = AudioPlayer();

  void _playQuestionSound() async {
    await _audioPlayer.play(AssetSource('audio/${_furiganaQuestion.question}.mp3'));
  }

  void _generateNewQuestion() {
    setState(() {
      _furiganaQuestion = _service.getRandomQuestion(widget.questionRanges, widget.questionTypes, widget.kanaType);
      _disabled = List.filled(_furiganaQuestion.answers.length, false); 
    });
    if (_furiganaQuestion.isAudio) _playQuestionSound();
  }

  @override
  void initState() {
    super.initState();
    _switchDelayMs = (widget.detailedSettings.switchDelay * 1000).toInt();
    _generateNewQuestion();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('振り仮名の練習')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: _furiganaQuestion.isAudio
                  ? ElevatedButton(
                      onPressed: () {
                        _playQuestionSound();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(160, 140),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: const Icon(Icons.volume_up, size: 36),
                    )
                  : Text(_furiganaQuestion.question, style: TextStyle(color: theme.colorScheme.primary, fontSize: 24))
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate((_furiganaQuestion.answers.length / 2).ceil(), (rowIndex) {
                  return Row(
                    children: List.generate(2, (colIndex) {
                      final int index = rowIndex * 2 + colIndex;
                      return index < _furiganaQuestion.answers.length
                        ? AnswerButton(
                            onPressed: () {
                              if (_disabled[index]) return;
                              setState(() {
                                _disabled[index] = true;
                              });
                              if (index == _furiganaQuestion.answerIndex) {
                                Future.delayed(Duration(milliseconds: _switchDelayMs), () {
                                  _generateNewQuestion();
                                });
                              }
                            },
                            text: _furiganaQuestion.answers[index],
                            correctAnswer: index == _furiganaQuestion.answerIndex,
                            disabled: _disabled[index],
                          )
                        : const SizedBox();
                    }),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}