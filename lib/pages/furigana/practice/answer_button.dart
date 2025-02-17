import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool correctAnswer;
  final bool disabled;

  const AnswerButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.correctAnswer,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ElevatedButton(
          onPressed: disabled ? () {} : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: disabled
              ? (correctAnswer ? Colors.greenAccent : Colors.redAccent)
              : null,
            minimumSize: Size(120, 80),
          ),
          child: Text(text, style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
