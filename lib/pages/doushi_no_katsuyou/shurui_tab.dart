import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:ruby_text/ruby_text.dart';

class ShuruiTab extends StatelessWidget {
  const ShuruiTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseTab(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RubyText(
              const Ruby('五段動詞', rubies: ['ご', 'だん', 'どう', 'し']).toRubyList(),
              style: theme.textTheme.titleMedium,
            ),
            const Divider(),
            const SizedBox(height: 5),
            const SizedBox(height: 20),
            RubyText(
              const Ruby('一段動詞', rubies: ['いち', 'だん', 'どう', 'し']).toRubyList(),
              style: theme.textTheme.titleMedium,
            ),
            const Divider(),
            const SizedBox(height: 5),
            RubyText(
              const Ruby('上一段動詞', rubies: ['かみ', 'いち', 'だん', 'どう', 'し']).toRubyList(),
              style: theme.textTheme.titleSmall,
            ),
            RubyText(
              const Ruby('下一段動詞', rubies: ['しも', 'いち', 'だん', 'どう', 'し']).toRubyList(),
              style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: 20),
            RubyText(
              const Ruby('変格動詞', rubies: ['へん', 'かく', 'どう', 'し']).toRubyList(),
              style: theme.textTheme.titleMedium,
            ),
            const Divider(),
            const SizedBox(height: 5),
            RubyText(
              const Ruby('サ行変格動詞', rubies: [null, 'ぎょう', 'へん', 'かく', 'どう', 'し']).toRubyList(),
              style: theme.textTheme.titleSmall,
            ),
            RubyText(
              const Ruby('カ行変格動詞', rubies: [null, 'ぎょう', 'へん', 'かく', 'どう', 'し']).toRubyList(),
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}