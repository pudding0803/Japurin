import 'package:flutter/material.dart';

class JitadoushiPage extends StatelessWidget {
  const JitadoushiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自・他動詞')),
      body: Center(
        child: Text('ここは自・他動詞のページです'),
      ),
    );
  }
}