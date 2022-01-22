import 'package:flutter/material.dart';

class EmptyListContent extends StatelessWidget {
  const EmptyListContent({
    Key? key,
    this.message = "Nothing to see here",
    this.content = "Add a new item to get started",
  }) : super(key: key);
  final String message;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
            style: const TextStyle(
              fontSize: 32.0,
              color: Colors.black87,
            ),
          ),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black38,
            ),
          )
        ],
      ),
    );
  }
}