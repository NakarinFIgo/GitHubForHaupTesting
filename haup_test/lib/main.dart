import 'package:flutter/material.dart';
import 'package:haup_test/category.dart';
import 'package:haup_test/sidebar.dart';

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
          seedColor: const Color.fromARGB(255, 22, 128, 26),
          primary: const Color.fromARGB(255, 22, 128, 26)  , // This sets the primary color for the app bar
        ),
      ),
      home: Scaffold(
      appBar: AppBar(
        title: const Text('Home',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 22, 128, 26),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Categorys(),
      drawer: const Sidebar(),
      )
    );
  }
}


