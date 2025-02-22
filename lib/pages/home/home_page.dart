import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/pages/doushi_no_katsuyou/doushi_no_katsuyou_page.dart';
import 'package:japurin/pages/furigana/furigana.dart';
import 'package:japurin/pages/home/home_navigation_button.dart';
import 'package:japurin/pages/jitadoushi/jitadoushi_page.dart';
import 'package:japurin/pages/suushi/suushi_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('ジャプリン Japurin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeNavigationButton(
                ruby: const Ruby('振り仮名', rubies: ['ふ', null, 'が', 'な']),
                pageBuilder: () => FuriganaPage(),
              ),
              HomeNavigationButton(
                ruby: const Ruby('数詞', rubies: ['すう', 'し']),
                pageBuilder: () => SuushiPage(),
              ),
              HomeNavigationButton(
                ruby: const Ruby('動詞の活用', rubies: ['どう', 'し', null, 'かつ', 'よう']),
                pageBuilder: () => DoushiNoKatsuyouPage(),
              ),
              HomeNavigationButton(
                ruby: const Ruby('自・他動詞', rubies: ['じ', null, 'た', 'どう', 'し']),
                pageBuilder: () => JitadoushiPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}