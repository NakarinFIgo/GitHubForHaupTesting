import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categorys extends StatefulWidget {
  const Categorys({super.key});

  @override
  State<Categorys> createState() => _CategorysState();
}

class _CategorysState extends State<Categorys> {
   List<dynamic> futureCategories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future <void> fetchCategories() async {
    var url = Uri.parse('https://dummyjson.com/products/categories');
    var response = await http.get(url);
    setState(() {
      futureCategories = json.decode(response.body);
    });
  }    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: futureCategories.length,
        itemBuilder:(context,index){
          final result = futureCategories[index];
          return ListTile(
            title: Row(
              children: [
                Text(result["name"]),
              ]),
          );
        })
        
      );
    
  }
}