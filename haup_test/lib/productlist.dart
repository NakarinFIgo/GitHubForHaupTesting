import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haup_test/detail.dart';
import 'bloc/bloc_shop_bloc.dart';

class ProductLists extends StatelessWidget {
  final String path;
  const ProductLists({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocShopBloc()..add(FetchProduct(path)),
      child: ProductListsView(path: path),
    );
  }
}

class ProductListsView extends StatelessWidget {
  final String path;
  const ProductListsView({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          path.toUpperCase(),
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFDAD3BE)),
        ),
        backgroundColor: const Color(0xFF254336),
        iconTheme: const IconThemeData(color: Color(0xFFDAD3BE)),
        centerTitle: true,
      ),
      body: BlocBuilder<BlocShopBloc, BlocShopState>(
        builder: (context, state) {
          if (state is BlocShopLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BlocShopLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Column(children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(product: product),
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
            );
          } else if (state is BlocShopError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
