import 'package:ruby_text/ruby_text.dart';

class Ruby {
  final String text;
  final List<String?> rubies;

  Ruby(this.text, this.rubies);

  List<RubyTextData> toRubyList() {
    List<RubyTextData> rubyList = [];
    for (int i = 0; i < text.length; i++) {
      rubyList.add(
        rubies[i] != null ? RubyTextData(text[i], ruby: rubies[i]!) : RubyTextData(text[i]),
      );
    }
    return rubyList;
  }
}