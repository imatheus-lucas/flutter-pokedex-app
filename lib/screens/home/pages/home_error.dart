import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  final String error;

  const HomeError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error),
      ),
    );
  }
}
