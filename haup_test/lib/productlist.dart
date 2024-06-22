import 'package:flutter/material.dart';

class SmartphonesPage extends StatelessWidget {
  const SmartphonesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smartphones'),
      ),
      body: const Center(
        child: Text('This is the Smartphones page'),
      ),
    );
  }
}