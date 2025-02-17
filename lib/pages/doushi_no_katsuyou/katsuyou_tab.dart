import 'package:flutter/material.dart';
import 'package:japurin/widgets/base_tab.dart';

class KatsuyouTab extends StatelessWidget {
  const KatsuyouTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTab(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text('ここは動詞の活用のページです'),
      ),
    );
  }
}