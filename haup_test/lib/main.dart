import 'package:flutter/material.dart';
import 'package:haup_test/category.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          primary: Colors.purple, // This sets the primary color for the app bar
        ),
      ),
      home: const Categorys(),
    );
  }
}


