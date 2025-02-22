import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/pages/furigana/furigana_learn/furigana_learn_page.dart';
import 'package:japurin/pages/furigana/furigana_navigation_button.dart';
import 'package:japurin/pages/furigana/practice/furigana_practice_settings_page.dart';

class FuriganaPage extends StatelessWidget {
  const FuriganaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('振り仮名')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FuriganaNavigationButton(
              ruby: const Ruby('学習', rubies: ['がく', 'しゅう']),
              pageBuilder: () => FuriganaLearnPage(),
            ),
            const SizedBox(height: 100),
            FuriganaNavigationButton(
              ruby: const Ruby('練習', rubies: ['れん', 'しゅう']),
              pageBuilder: () => FuriganaPracticeSettingsPage(),
            ),
          ],
        ),
      ),
    );
  }
}