import 'package:flutter/material.dart';
import 'package:japurin/models/ruby.dart';
import 'package:japurin/pages/suushi/number_list_page.dart';
import 'package:japurin/widgets/base_tab.dart';
import 'package:ruby_text/ruby_text.dart';

class SuushiTab extends StatelessWidget {
  final String title;
  final Map<Ruby, List<Ruby>> suushi;

  const SuushiTab({
    super.key,
    required this.title,
    required this.suushi,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTab(
      child: GridView.count(
        crossAxisCount: 3,
        children: suushi.entries.map((entry) {
          return Padding(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NumberListPage(
                  title: '$title - ${entry.key.toString()}',
                  items: entry.value,
                )),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: RubyText(entry.key.toRubyList()),
            ),
          );
        }).toList(),
      ),
    );
  }
}
