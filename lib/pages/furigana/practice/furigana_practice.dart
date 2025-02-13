import 'package:flutter/material.dart';
import 'package:japurin/pages/furigana/practice/answer_button.dart';

class FuriganaPracticePage extends StatelessWidget {
  static const List<String> answers = ['A', 'B', 'C', 'D', 'E', 'F'];

  const FuriganaPracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('振り仮名の練習')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(160, 140),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text('大按鈕', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate((answers.length / 2).ceil(), (rowIndex) {
                  return Row(
                    children: List.generate(2, (colIndex) {
                      int index = rowIndex * 2 + colIndex;
                      return index < answers.length
                        ? AnswerButton(text: answers[index])
                        : SizedBox();
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