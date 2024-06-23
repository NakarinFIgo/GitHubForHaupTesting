import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:haup_test/detail.dart';
import 'package:http/http.dart' as http;

class ProductLists extends StatefulWidget {
  final String path;
  const ProductLists({super.key, required this.path});

  @override
  State<ProductLists> createState() => _ProductListsState();
}

class _ProductListsState extends State<ProductLists> {
  List<dynamic>? _products;

  @override
  void initState() {
    super.initState();
    fetchProductDetail();
  }

  Future<void> fetchProductDetail() async {
    final response = await http.get(
        Uri.parse('https://dummyjson.com/products/category/${widget.path}'));
    if (response.statusCode == 200) {
      setState(() {
        _products = json.decode(response.body)['products'];
      });
    } else {
      // Handle the error
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.path.toUpperCase(),
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFDAD3BE)),
        ),
        backgroundColor:const Color(0xFF254336),
        iconTheme: const IconThemeData(color: Color(0xFFDAD3BE)),
        centerTitle: true,
      ),
      body: _products == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _products?.length,
              itemBuilder: (context, index) {
                final product = _products![index];
                return Column(children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Details(product: product),
                        ),
                      );
                    },
                    leading: Image.network(
                      product['thumbnail'],
                      fit: BoxFit.contain,
                      width: 100,
                      height: 80,
                    ),
                    title: Text(product['title']),
                    subtitle: Text(
                      product['description'],
                      maxLines: 2,
                    ),
                    trailing: Text(
                      '\$${product['price']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 16),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color.fromARGB(255, 209, 208, 208),
                  )
                ]);
              },
            ),
    );
  }
}
