import 'package:flutter/material.dart';

class FuriganaPage extends StatelessWidget {
  const FuriganaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('振り仮名')),
      body: Center(
        child: Text('ここは振り仮名のページです', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}