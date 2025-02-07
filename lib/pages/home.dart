import 'package:flutter/material.dart';
import 'package:japurin/utils/ruby.dart';
import 'package:japurin/routes.dart';
import 'package:japurin/widgets/home_page_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
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
                HomePageButton(
                  ruby: Ruby('振り仮名', ['ふ', null, 'が', 'な']),
                  page: Routes.furigana
                ),
                HomePageButton(
                  ruby: Ruby('助数詞', ['じょ', 'すう', 'し']),
                  page: Routes.josuushi,
                ),
                HomePageButton(
                  ruby: Ruby('自・他動詞', ['じ', null, 'た', 'どう', 'し']),
                  page: Routes.jitadoushi,
                ),
              ]
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}