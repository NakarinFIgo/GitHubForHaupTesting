import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:haup_test/sidebar.dart';
import 'package:http/http.dart' as http;
import 'productlist.dart';

class Categorys extends StatefulWidget {
  const Categorys({super.key});

  @override
  State<Categorys> createState() => _CategorysState();
}

class _CategorysState extends State<Categorys> {
  List<dynamic> futureCategories = [];

  // Language state
  String currentLanguage = 'en'; // Default language

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

  // Function to change language
  void changeLanguage(String languageCode) {
    setState(() {
      currentLanguage = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: currentLanguage == 'en'? const Text('Categories', style: TextStyle(fontSize: 24)):const Text('หมวดหมู่สินค้า', style: TextStyle(fontSize: 24)) ,
      ),
      drawer: Sidebar(
        onLanguageChanged: changeLanguage,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromARGB(74, 46, 44, 44), width: 1)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: futureCategories.length,
                itemBuilder: (context, index) {
                  final result = futureCategories[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductLists(path: result['slug']),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            result["name"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            result["slug"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
