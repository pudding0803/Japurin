import 'package:flutter/material.dart';
import 'package:ruby_text/ruby_text.dart';

class Ruby {
  final String? text;
  final List<String>? texts;
  final List<String?>? rubies;
  final bool bold;
  final Color color;
  
  const Ruby(this.text, [this.rubies, this.bold = false, this.color = Colors.black]) : texts = null;

  const Ruby.multi(this.texts, this.rubies, [this.bold = false, this.color = Colors.black]) : text = null;

  List<RubyTextData> toRubyList() {
    if (text != null) {
      if (rubies == null) return [RubyTextData(text!, )];

      return List.generate(text!.length, (i) {
        return RubyTextData(text![i], ruby: rubies![i]);
      });
    }

    if (texts != null) {
      return List.generate(texts!.length, (i) {
        return RubyTextData(texts![i], ruby: rubies![i]);
      });
    }

    return [];
  }
}