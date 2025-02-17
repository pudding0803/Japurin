class FuriganaQuestion {
  final String question;
  final List<String> answers;
  final int answerIndex;
  final bool isAudio;

  FuriganaQuestion({
    required this.question,
    required this.answers,
    required this.answerIndex,
    required this.isAudio,
  });
}