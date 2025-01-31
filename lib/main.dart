import 'package:flutter/material.dart';

import 'dart:convert';

import 'Homepage.dart';

void main() {
  runApp(const QuizApp());
}
class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}


