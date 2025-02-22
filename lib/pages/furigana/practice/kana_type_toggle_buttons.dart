import 'package:flutter/material.dart';

class KanaTypeToggleButtons extends StatelessWidget {
  final ValueNotifier<int> kanaType;

  const KanaTypeToggleButtons({
    super.key,
    required this.kanaType,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: kanaType,
      builder: (context, value, child) {
        return ToggleButtons(
          isSelected: List.generate(3, (i) => value == i),
          onPressed: (int index) {
            kanaType.value = index;
          },
          borderRadius: BorderRadius.circular(10),
          constraints: const BoxConstraints(minWidth: 70, minHeight: 40),
          children: const [
            Text('平仮名'),
            Text('片仮名'),
            Text('両方'),
          ],
        );
      },
    );
  }
}