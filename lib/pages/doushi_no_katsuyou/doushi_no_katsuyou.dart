import 'package:flutter/material.dart';

class DoushiNoKatsuyouPage extends StatelessWidget {
  const DoushiNoKatsuyouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('動詞の活用')),
      body: Center(
        child: Text('ここは動詞の活用のページです'),
      ),
    );
  }
}