import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:japurin/enums/furigana_type.dart';
import 'package:japurin/pages/furigana/furigana_learn/dakuon_and_handakuon_tab.dart';
import 'package:japurin/pages/furigana/furigana_learn/seion_and_hatsuon_tab.dart';
import 'package:japurin/pages/furigana/furigana_learn/sokuon_and_youon_tab.dart';

class FuriganaLearnPage extends StatefulWidget {
  const FuriganaLearnPage({super.key});

  @override
  State<FuriganaLearnPage> createState() => _FuriganaLearnPageState();
}

class _FuriganaLearnPageState extends State<FuriganaLearnPage> {
  FuriganaType _furiganaType = FuriganaType.hiragana;

  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playKanaSound(String kana) async {
    await _audioPlayer.play(AssetSource('audio/$kana.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('振り仮名の学習'),
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
            SeionAndHatsuonTab(furiganaType: _furiganaType, playSound: _playKanaSound),
            DakuonAndHandakuonTab(furiganaType: _furiganaType, playSound: _playKanaSound),
            SokuonAndYouonTab(furiganaType: _furiganaType, playSound: _playKanaSound),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
                _furiganaType = FuriganaType.values[(_furiganaType.index + 1) % FuriganaType.values.length];
            });
          },
          tooltip: '${switch (_furiganaType) {
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
                  switch (_furiganaType) {
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