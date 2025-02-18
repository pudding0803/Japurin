import 'package:japurin/enums/furigana_type.dart';

class Furigana {
  final String hiragana;
  final String katakana;
  final String romaji;

  const Furigana(this.hiragana, this.katakana, this.romaji);

  String getValue(FuriganaType type) {
    switch (type) {
      case FuriganaType.hiragana:
        return hiragana;
      case FuriganaType.katakana:
        return katakana;
      case FuriganaType.romaji:
        return romaji;
    }
  }
}
