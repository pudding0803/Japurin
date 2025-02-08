import 'package:flutter/material.dart';

class JosuushiPage extends StatelessWidget {
  const JosuushiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('助数詞')),
      body: Center(
        child: Text('ここは助数詞のページです', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}