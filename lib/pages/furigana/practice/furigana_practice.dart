import 'package:flutter/material.dart';

class FuriganaPracticePage extends StatelessWidget {
  const FuriganaPracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('振り仮名の練習')),
      body: Center(
        child: Text('ここは振り仮名の練習のページです'),
      ),
    );
  }
}