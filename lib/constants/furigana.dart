
import 'package:japurin/models/furigana.dart';

const seion = {
  'a': [
    Furigana('あ', 'ア', 'a'),
    Furigana('い', 'イ', 'i'),
    Furigana('う', 'ウ', 'u'),
    Furigana('え', 'エ', 'e'),
    Furigana('お', 'オ', 'o'),
  ],
  'ka': [
    Furigana('か', 'カ', 'ka'),
    Furigana('き', 'キ', 'ki'),
    Furigana('く', 'ク', 'ku'),
    Furigana('け', 'ケ', 'ke'),
    Furigana('こ', 'コ', 'ko'),
  ],
  'sa': [
    Furigana('さ', 'サ', 'sa'),
    Furigana('し', 'シ', 'shi'),
    Furigana('す', 'ス', 'su'),
    Furigana('せ', 'セ', 'se'),
    Furigana('そ', 'ソ', 'so'),
  ],
  'ta': [
    Furigana('た', 'タ', 'ta'),
    Furigana('ち', 'チ', 'chi'),
    Furigana('つ', 'ツ', 'tsu'),
    Furigana('て', 'テ', 'te'),
    Furigana('と', 'ト', 'to'),
  ],
  'na': [
    Furigana('な', 'ナ', 'na'),
    Furigana('に', 'ニ', 'ni'),
    Furigana('ぬ', 'ヌ', 'nu'),
    Furigana('ね', 'ネ', 'ne'),
    Furigana('の', 'ノ', 'no'),
  ],
  'ha': [
    Furigana('は', 'ハ', 'ha'),
    Furigana('ひ', 'ヒ', 'hi'),
    Furigana('ふ', 'フ', 'fu'),
    Furigana('へ', 'ヘ', 'he'),
    Furigana('ほ', 'ホ', 'ho'),
  ],
  'ma': [
    Furigana('ま', 'マ', 'ma'),
    Furigana('み', 'ミ', 'mi'),
    Furigana('む', 'ム', 'mu'),
    Furigana('め', 'メ', 'me'),
    Furigana('も', 'モ', 'mo'),
  ],
  'ya': [
    Furigana('や', 'ヤ', 'ya'),
    Furigana('ゆ', 'ユ', 'yu'),
    Furigana('よ', 'ヨ', 'yo'),
  ],
  'ra': [
    Furigana('ら', 'ラ', 'ra'),
    Furigana('り', 'リ', 'ri'),
    Furigana('る', 'ル', 'ru'),
    Furigana('れ', 'レ', 're'),
    Furigana('ろ', 'ロ', 'ro'),
  ],
  'wa': [
    Furigana('わ', 'ワ', 'wa'),
    Furigana('を', 'ヲ', 'wo'),
  ],
};

const hatsuon = Furigana('ん', 'ン', 'n');

const dakuon = {
  'ga': [
    Furigana('が', 'ガ', 'ga'),
    Furigana('ぎ', 'ギ', 'gi'),
    Furigana('ぐ', 'グ', 'gu'),
    Furigana('げ', 'ゲ', 'ge'),
    Furigana('ご', 'ゴ', 'go'),
  ],
  'za': [
    Furigana('ざ', 'ザ', 'za'),
    Furigana('じ', 'ジ', 'ji'),
    Furigana('ず', 'ズ', 'zu'),
    Furigana('ぜ', 'ゼ', 'ze'),
    Furigana('ぞ', 'ゾ', 'zo'),
  ],
  'da': [
    Furigana('だ', 'ダ', 'da'),
    Furigana('ぢ', 'ヂ', 'ji'),
    Furigana('づ', 'ヅ', 'zu'),
    Furigana('で', 'デ', 'de'),
    Furigana('ど', 'ド', 'do'),
  ],
  'ba': [
    Furigana('ば', 'バ', 'ba'),
    Furigana('び', 'ビ', 'bi'),
    Furigana('ぶ', 'ブ', 'bu'),
    Furigana('べ', 'ベ', 'be'),
    Furigana('ぼ', 'ボ', 'bo'),
  ],
};

const handakuon = {
  'pa': [
    Furigana('ぱ', 'パ', 'pa'),
    Furigana('ぴ', 'ピ', 'pi'),
    Furigana('ぷ', 'プ', 'pu'),
    Furigana('ぺ', 'ペ', 'pe'),
    Furigana('ぽ', 'ポ', 'po'),
  ],
};

const sokuon = Furigana('っ', 'ッ', '');

const youon = {
  'ka': [
    Furigana('きゃ', 'キャ', 'kya'),
    Furigana('きゅ', 'キュ', 'kyu'),
    Furigana('きょ', 'キョ', 'kyo'),
  ],
  'sa': [
    Furigana('しゃ', 'シャ', 'sha'),
    Furigana('しゅ', 'シュ', 'shu'),
    Furigana('しょ', 'ショ', 'sho'),
  ],
  'ta': [
    Furigana('ちゃ', 'チャ', 'cha'),
    Furigana('ちゅ', 'チュ', 'chu'),
    Furigana('ちょ', 'チョ', 'cho'),
  ],
  'na': [
    Furigana('にゃ', 'ニャ', 'nya'),
    Furigana('にゅ', 'ニュ', 'nyu'),
    Furigana('にょ', 'ニョ', 'nyo'),
  ],
  'ha': [
    Furigana('ひゃ', 'ヒャ', 'hya'),
    Furigana('ひゅ', 'ヒュ', 'hyu'),
    Furigana('ひょ', 'ヒョ', 'hyo'),
  ],
  'ma': [
    Furigana('みゃ', 'ミャ', 'mya'),
    Furigana('みゅ', 'ミュ', 'myu'),
    Furigana('みょ', 'ミョ', 'myo'),
  ],
  'ra': [
    Furigana('りゃ', 'リャ', 'rya'),
    Furigana('りゅ', 'リュ', 'ryu'),
    Furigana('りょ', 'リョ', 'ryo'),
  ],
  'ga': [
    Furigana('ぎゃ', 'ギャ', 'gya'),
    Furigana('ぎゅ', 'ギュ', 'gyu'),
    Furigana('ぎょ', 'ギョ', 'gyo'),
  ],
  'za': [
    Furigana('じゃ', 'ジャ', 'ja'),
    Furigana('じゅ', 'ジュ', 'ju'),
    Furigana('じょ', 'ジョ', 'jo'),
  ],
  'ba': [
    Furigana('びゃ', 'ビャ', 'bya'),
    Furigana('びゅ', 'ビュ', 'byu'),
    Furigana('びょ', 'ビョ', 'byo'),
  ],
  'pa': [
    Furigana('ぴゃ', 'ピャ', 'pya'),
    Furigana('ぴゅ', 'ピュ', 'pyu'),
    Furigana('ぴょ', 'ピョ', 'pyo'),
  ],
};