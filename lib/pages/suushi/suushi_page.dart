import 'package:flutter/material.dart';
import 'package:japurin/constants/suushi.dart';
import 'package:japurin/pages/suushi/suushi_tab.dart';
import 'package:japurin/pages/suushi/onbin_tab.dart';

class SuushiPage extends StatelessWidget {
  const SuushiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('数詞'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '基数詞'),
              Tab(text: '助数詞'),
              Tab(text: '音便の規則')
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SuushiTab(title: '基数詞', suushi: kisuushi),
            SuushiTab(title: '助数詞', suushi: josuushi),
            OnbinTab(),
          ],
        ),
      ),
    );
  }
}