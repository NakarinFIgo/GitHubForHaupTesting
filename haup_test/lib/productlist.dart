import 'dart:convert';
import 'package:flutter/material.dart';
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
        title: const Text("Product List"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: _products == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _products?.length,
              itemBuilder: (context, index) {
                final product = _products![index];
                return ListTile(
                  leading: Image.network(product['thumbnail']),
                  title: Text(product['title']),
                  subtitle: Text(product['description']),
                  trailing: Text('\$${product['price']}'),
                );
              },
            ),
    );
  }
}
