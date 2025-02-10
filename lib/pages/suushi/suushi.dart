import 'package:flutter/material.dart';
import 'package:japurin/pages/suushi/josuushi_tab.dart';
import 'package:japurin/pages/suushi/kisuushi_tab.dart';
import 'package:japurin/pages/suushi/onbin_tab.dart';

class SuushiPage extends StatelessWidget {
  const SuushiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('数詞'),
          bottom: TabBar(
            tabs: [
              Tab(text: '基数詞'),
              Tab(text: '助数詞'),
              Tab(text: '音便の規則')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            KisuushiTab(),
            JosuushiTab(),
            OnbinTab(),
          ],
        ),
      ),
    );
  }
}