import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:ruby_text/ruby_text.dart';

class NumberListPage extends StatelessWidget {
  static const List<String> leadings = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '?'];

  final String title;
  final List<Ruby> items;

  const NumberListPage({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 20),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final Ruby ruby = items[index];
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(child: Text(leadings[index])),
                title: RubyText(
                  items[index].toRubyList(),
                  style: TextStyle(
                    color: ruby.color,
                    fontSize: 18,
                    fontWeight: ruby.bold ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              if (index < items.length - 1) const Divider(),
            ]
          );
        },
      ),
    );
  }
}