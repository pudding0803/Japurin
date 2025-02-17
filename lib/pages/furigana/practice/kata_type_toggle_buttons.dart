import 'package:flutter/material.dart';

class KataTypeToggleButtons extends StatelessWidget {
  final ValueNotifier<int> kataType;

  const KataTypeToggleButtons({
    super.key,
    required this.kataType,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: kataType,
      builder: (context, value, child) {
        return ToggleButtons(
          isSelected: List.generate(4, (i) => value == i),
          onPressed: (int index) {
            kataType.value = index;
          },
          borderRadius: BorderRadius.circular(10),
          constraints: BoxConstraints(minWidth: 70, minHeight: 40),
          children: [
            Text('平仮名'),
            Text('片仮名'),
            Text('両方'),
            Text('ミックス'),
          ],
        );
      },
    );
  }
}