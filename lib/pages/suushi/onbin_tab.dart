import 'package:flutter/material.dart';
import 'package:japurin/constants/suushi.dart';
import 'package:japurin/widgets/base_tab.dart';

class OnbinTab extends StatelessWidget {
  static const leadings = ['1', '3', '6', '8', '10', '?'];

  const OnbinTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTab(
      child: SingleChildScrollView(
        child: Column(
          children: onbin.entries.map((entry) {
            return ExpansionTile(
              title: Text('「${entry.key}行」で始まる数詞'),
              childrenPadding: EdgeInsets.only(bottom: 5),
              children: entry.value.asMap().entries.map((e) {
                return ListTile(
                  leading: CircleAvatar(child: Text(leadings[e.key])),
                  title: Text(e.value),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
