import 'package:flutter/material.dart';
import 'package:japurin/models/furigana.dart';
import 'package:japurin/pages/furigana/dakuon_and_handakuon_tab.dart';
import 'package:japurin/pages/furigana/seion_and_hatsuon_tab.dart';
import 'package:japurin/pages/furigana/sokuon_and_youon_tab.dart';

class FuriganaPage extends StatefulWidget {
  const FuriganaPage({super.key});

  @override
  State<FuriganaPage> createState() => _FuriganaPageState();
}

class _FuriganaPageState extends State<FuriganaPage> {
  FuriganaType furiganaType = FuriganaType.hiragana;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('振り仮名'),
          bottom: TabBar(
            tabs: [
              Tab(text: '清音・撥音'),
              Tab(text: '濁音・半濁音'),
              Tab(text: '促音・拗音'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SeionAndHatsuonTab(furiganaType: furiganaType),
            DakuonAndHandakuonTab(furiganaType: furiganaType),
            SokuonAndYouonTab(furiganaType: furiganaType),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
                furiganaType = FuriganaType.values[(furiganaType.index + 1) % FuriganaType.values.length];
            });
          },
          tooltip: '${switch (furiganaType) {
            FuriganaType.hiragana => '片仮名',
            FuriganaType.katakana => 'ローマ字',
            FuriganaType.romaji => '平仮名',
          }}に切り替える',
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Transform.translate(
                offset: Offset(-4, -4),
                child: Text(
                  switch (furiganaType) {
                    FuriganaType.hiragana => 'ア',
                    FuriganaType.katakana => 'ａ',
                    FuriganaType.romaji => 'あ',
                  },
                  style: TextStyle(fontSize: 28)),
              ),
              Positioned(
                bottom: 0,
                right: -7,
                child: Icon(Icons.sync_alt, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}