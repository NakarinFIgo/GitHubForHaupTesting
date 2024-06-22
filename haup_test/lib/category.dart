import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'productlist.dart';

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

  Future<void> fetchCategories() async {
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
      body: Column(
        children: [
          Container(
            width: 380,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.purple,width: 4))
            ),
            child: const Text("Category",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple
            )
            ,),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: futureCategories.length,
                  itemBuilder: (context, index) {
                    final result = futureCategories[index];
                    return ListTile(
                      title: Row(children: [
                        Text(result["name"]),
                      ]),
                      subtitle: Text(result["slug"]),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductLists(path: result['slug'])));
                      },
                    );
                  }))
        ],
      ),
    );
  }
}
