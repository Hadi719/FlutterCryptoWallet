import 'package:flutter/material.dart'
    show BuildContext, Center, Colors, StatelessWidget, Text, TextStyle, Widget;

class MyError extends StatelessWidget {
  final String error;

  const MyError({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
