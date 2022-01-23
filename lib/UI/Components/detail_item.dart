import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({Key? key, required this.label, required this.content})
      : super(key: key);

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label.toUpperCase(),
            style:
                const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
        Text(
          content,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
