import 'package:flutter/material.dart';
import 'package:japurin/pages/doushi_no_katsuyou/katsuyou_tab.dart';
import 'package:japurin/pages/doushi_no_katsuyou/shurui_tab.dart';

class DoushiNoKatsuyouPage extends StatelessWidget {
  const DoushiNoKatsuyouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('動詞の活用'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '種類'),
              Tab(text: '活用'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ShuruiTab(),
            KatsuyouTab(),
          ],
        ),
      ),
    );
  }
}