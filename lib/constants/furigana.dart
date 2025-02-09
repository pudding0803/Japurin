import 'package:japurin/models/furigana.dart';

const Map<Furigana, List<Furigana>> seion = {
  Furigana('あ', 'ア', 'a'): [
    Furigana('あ', 'ア', 'a'),
    Furigana('い', 'イ', 'i'),
    Furigana('う', 'ウ', 'u'),
    Furigana('え', 'エ', 'e'),
    Furigana('お', 'オ', 'o'),
  ],
  Furigana('か', 'カ', 'ka'): [
    Furigana('か', 'カ', 'ka'),
    Furigana('き', 'キ', 'ki'),
    Furigana('く', 'ク', 'ku'),
    Furigana('け', 'ケ', 'ke'),
    Furigana('こ', 'コ', 'ko'),
  ],
  Furigana('さ', 'サ', 'sa'): [
    Furigana('さ', 'サ', 'sa'),
    Furigana('し', 'シ', 'shi'),
    Furigana('す', 'ス', 'su'),
    Furigana('せ', 'セ', 'se'),
    Furigana('そ', 'ソ', 'so'),
  ],
  Furigana('た', 'タ', 'ta'): [
    Furigana('た', 'タ', 'ta'),
    Furigana('ち', 'チ', 'chi'),
    Furigana('つ', 'ツ', 'tsu'),
    Furigana('て', 'テ', 'te'),
    Furigana('と', 'ト', 'to'),
  ],
  Furigana('な', 'ナ', 'na'): [
    Furigana('な', 'ナ', 'na'),
    Furigana('に', 'ニ', 'ni'),
    Furigana('ぬ', 'ヌ', 'nu'),
    Furigana('ね', 'ネ', 'ne'),
    Furigana('の', 'ノ', 'no'),
  ],
  Furigana('は', 'ハ', 'ha'): [
    Furigana('は', 'ハ', 'ha'),
    Furigana('ひ', 'ヒ', 'hi'),
    Furigana('ふ', 'フ', 'fu'),
    Furigana('へ', 'ヘ', 'he'),
    Furigana('ほ', 'ホ', 'ho'),
  ],
  Furigana('ま', 'マ', 'ma'): [
    Furigana('ま', 'マ', 'ma'),
    Furigana('み', 'ミ', 'mi'),
    Furigana('む', 'ム', 'mu'),
    Furigana('め', 'メ', 'me'),
    Furigana('も', 'モ', 'mo'),
  ],
  Furigana('や', 'ヤ', 'ya'): [
    Furigana('や', 'ヤ', 'ya'),
    Furigana('ゆ', 'ユ', 'yu'),
    Furigana('よ', 'ヨ', 'yo'),
  ],
  Furigana('ら', 'ラ', 'ra'): [
    Furigana('ら', 'ラ', 'ra'),
    Furigana('り', 'リ', 'ri'),
    Furigana('る', 'ル', 'ru'),
    Furigana('れ', 'レ', 're'),
    Furigana('ろ', 'ロ', 'ro'),
  ],
  Furigana('わ', 'ワ', 'wa'): [
    Furigana('わ', 'ワ', 'wa'),
    Furigana('を', 'ヲ', 'wo'),
  ],
};

const Furigana hatsuon = Furigana('ん', 'ン', 'n');

const Map<Furigana, List<Furigana>> dakuon = {
  Furigana('が', 'ガ', 'ga'): [
    Furigana('が', 'ガ', 'ga'),
    Furigana('ぎ', 'ギ', 'gi'),
    Furigana('ぐ', 'グ', 'gu'),
    Furigana('げ', 'ゲ', 'ge'),
    Furigana('ご', 'ゴ', 'go'),
  ],
  Furigana('ざ', 'ザ', 'za'): [
    Furigana('ざ', 'ザ', 'za'),
    Furigana('じ', 'ジ', 'ji'),
    Furigana('ず', 'ズ', 'zu'),
    Furigana('ぜ', 'ゼ', 'ze'),
    Furigana('ぞ', 'ゾ', 'zo'),
  ],
  Furigana('だ', 'ダ', 'da'): [
    Furigana('だ', 'ダ', 'da'),
    Furigana('ぢ', 'ヂ', 'ji'),
    Furigana('づ', 'ヅ', 'zu'),
    Furigana('で', 'デ', 'de'),
    Furigana('ど', 'ド', 'do'),
  ],
  Furigana('ば', 'バ', 'ba'): [
    Furigana('ば', 'バ', 'ba'),
    Furigana('び', 'ビ', 'bi'),
    Furigana('ぶ', 'ブ', 'bu'),
    Furigana('べ', 'ベ', 'be'),
    Furigana('ぼ', 'ボ', 'bo'),
  ],
};

const Map<Furigana, List<Furigana>> handakuon = {
  Furigana('ぱ', 'パ', 'pa'): [
    Furigana('ぱ', 'パ', 'pa'),
    Furigana('ぴ', 'ピ', 'pi'),
    Furigana('ぷ', 'プ', 'pu'),
    Furigana('ぺ', 'ペ', 'pe'),
    Furigana('ぽ', 'ポ', 'po'),
  ],
};

const Furigana sokuon = Furigana('っ', 'ッ', '-');

const Map<Furigana, List<Furigana>> youon = {
  Furigana('き', 'キ', 'ki'): [
    Furigana('きゃ', 'キャ', 'kya'),
    Furigana('きゅ', 'キュ', 'kyu'),
    Furigana('きょ', 'キョ', 'kyo'),
  ],
  Furigana('し', 'シ', 'shi'): [
    Furigana('しゃ', 'シャ', 'sha'),
    Furigana('しゅ', 'シュ', 'shu'),
    Furigana('しょ', 'ショ', 'sho'),
  ],
  Furigana('ち', 'チ', 'chi'): [
    Furigana('ちゃ', 'チャ', 'cha'),
    Furigana('ちゅ', 'チュ', 'chu'),
    Furigana('ちょ', 'チョ', 'cho'),
  ],
  Furigana('に', 'ニ', 'ni'): [
    Furigana('にゃ', 'ニャ', 'nya'),
    Furigana('にゅ', 'ニュ', 'nyu'),
    Furigana('にょ', 'ニョ', 'nyo'),
  ],
  Furigana('ひ', 'ヒ', 'hi'): [
    Furigana('ひゃ', 'ヒャ', 'hya'),
    Furigana('ひゅ', 'ヒュ', 'hyu'),
    Furigana('ひょ', 'ヒョ', 'hyo'),
  ],
  Furigana('み', 'ミ', 'mi'): [
    Furigana('みゃ', 'ミャ', 'mya'),
    Furigana('みゅ', 'ミュ', 'myu'),
    Furigana('みょ', 'ミョ', 'myo'),
  ],
  Furigana('り', 'リ', 'ri'): [
    Furigana('りゃ', 'リャ', 'rya'),
    Furigana('りゅ', 'リュ', 'ryu'),
    Furigana('りょ', 'リョ', 'ryo'),
  ],
  Furigana('ぎ', 'ギ', 'gi'): [
    Furigana('ぎゃ', 'ギャ', 'gya'),
    Furigana('ぎゅ', 'ギュ', 'gyu'),
    Furigana('ぎょ', 'ギョ', 'gyo'),
  ],
  Furigana('じ', 'ジ', 'ji'): [
    Furigana('じゃ', 'ジャ', 'ja'),
    Furigana('じゅ', 'ジュ', 'ju'),
    Furigana('じょ', 'ジョ', 'jo'),
  ],
  Furigana('ぢ', 'ヂ', 'ji'): [
    Furigana('ぢゃ', 'ヂャ', 'ja'),
    Furigana('ぢゅ', 'ヂュ', 'ju'),
    Furigana('ぢょ', 'ヂョ', 'jo'),
  ],
  Furigana('び', 'ビ', 'bi'): [
    Furigana('びゃ', 'ビャ', 'bya'),
    Furigana('びゅ', 'ビュ', 'byu'),
    Furigana('びょ', 'ビョ', 'byo'),
  ],
  Furigana('ぴ', 'ピ', 'pi'): [
    Furigana('ぴゃ', 'ピャ', 'pya'),
    Furigana('ぴゅ', 'ピュ', 'pyu'),
    Furigana('ぴょ', 'ピョ', 'pyo'),
  ],
};