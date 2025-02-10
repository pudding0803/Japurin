import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
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
          children: [
            HomeNavigationButton(
              ruby: Ruby('振り仮名', rubies: ['ふ', null, 'が', 'な']),
              route: Routes.furigana
            ),
            const SizedBox(height: 30),
            HomeNavigationButton(
              ruby: Ruby('数詞', rubies: ['すう', 'し']),
              route: Routes.suushi,
            ),
            const SizedBox(height: 30),
            HomeNavigationButton(
              ruby: Ruby('自・他動詞', rubies: ['じ', null, 'た', 'どう', 'し']),
              route: Routes.jitadoushi,
            ),
          ],
        ),
      ),
    );
  }
}