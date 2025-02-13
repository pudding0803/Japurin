import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  final String label;
  final ValueNotifier<bool> checkboxValue;

  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.checkboxValue,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: checkboxValue,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () => checkboxValue.value = !value,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: value,
                onChanged: (val) => checkboxValue.value = val!,
              ),
              Text(label),
            ],
          ),
        );
      },
    );
  }
}