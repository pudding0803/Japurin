import 'package:flutter/material.dart';
import 'package:japurin/utils/ruby.dart';
import 'package:japurin/routes.dart';
import 'package:japurin/pages/home/home_navigation_button.dart';

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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                HomeNavigationButton(
                  ruby: Ruby('振り仮名', ['ふ', null, 'が', 'な']),
                  route: Routes.furigana
                ),
                HomeNavigationButton(
                  ruby: Ruby('助数詞', ['じょ', 'すう', 'し']),
                  route: Routes.josuushi,
                ),
                HomeNavigationButton(
                  ruby: Ruby('自・他動詞', ['じ', null, 'た', 'どう', 'し']),
                  route: Routes.jitadoushi,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}