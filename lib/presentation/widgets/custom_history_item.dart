import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHistoryItem extends StatelessWidget {
  const CustomHistoryItem({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subTitle),//

    );
  }
}