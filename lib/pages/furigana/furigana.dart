import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/pages/furigana/furigana_learn/furigana_learn.dart';
import 'package:japurin/pages/furigana/practice/furigana_practice.dart';
import 'package:japurin/widgets/navigation_button.dart';

class FuriganaPage extends StatelessWidget {
  const FuriganaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('振り仮名')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigationButton(
              ruby: Ruby('学習', rubies: ['がく', 'しゅう']),
              page: FuriganaLearnPage(),
            ),
            const SizedBox(height: 40),
            NavigationButton(
              ruby: Ruby('練習', rubies: ['れん', 'しゅう']),
              page: FuriganaPracticePage(),
            ),
          ],
        ),
      ),
    );
  }
}