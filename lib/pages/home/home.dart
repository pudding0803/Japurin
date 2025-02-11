import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/pages/doushi_no_katsuyou/doushi_no_katsuyou.dart';
import 'package:japurin/pages/furigana/furigana.dart';
import 'package:japurin/pages/jitadoushi/jitadoushi.dart';
import 'package:japurin/pages/suushi/suushi.dart';
import 'package:japurin/widgets/navigation_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ジャプリン Japurin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigationButton(
              ruby: Ruby('振り仮名', rubies: ['ふ', null, 'が', 'な']),
              page: FuriganaPage(),
            ),
            const SizedBox(height: 40),
            NavigationButton(
              ruby: Ruby('数詞', rubies: ['すう', 'し']),
              page: SuushiPage(),
            ),
            const SizedBox(height: 40),
            NavigationButton(
              ruby: Ruby('動詞の活用', rubies: ['どう', 'し', null, 'かつ', 'よう']),
              page: DoushiNoKatsuyouPage(),
            ),
            const SizedBox(height: 40),
            NavigationButton(
              ruby: Ruby('自・他動詞', rubies: ['じ', null, 'た', 'どう', 'し']),
              page: JitadoushiPage(),
            ),
          ],
        ),
      ),
    );
  }
}