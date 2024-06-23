import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Map<String, dynamic> product;

  const Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: product['thumbnail'] != null
                  ? Image.network(
                      product['thumbnail'],
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF254336)),
            ),
            const SizedBox(height: 8),
            Text(
              product['description'] ?? 'No Description',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Price: ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF254336)),
                ),
                Text("${product['price']} \$",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Rating: ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  product['rating'].toString(),
                  style: const TextStyle(color: Color.fromARGB(255, 230, 196, 9),fontWeight: FontWeight.bold,fontSize: 16),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Brand: ${product['brand'] ?? 'Unknown'}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF254336)),
            ),
            const SizedBox(height: 8),
            Text(
              'Availability: ${product['availabilityStatus'] ?? 'N/A'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Stock: ${product['stock']?.toString() ?? 'N/A'}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF254336)),
            ),
            const SizedBox(height: 8),
            Text(
              'SKU: ${product['sku'] ?? 'N/A'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Shipping Information:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF254336)),
            ),
            const SizedBox(height: 8),
            Text(
              product['shippingInformation'] ?? 'No Information',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Return Policy:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF254336)),
            ),
            const SizedBox(height: 8),
            Text(
              product['returnPolicy'] ?? 'No Information',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Reviews:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF254336)),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (product['reviews'] as List<dynamic>?)?.map((review) {
                    return ListTile(
                        title: Text(
                          '${review['rating']} stars',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF254336)),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(review['comment']),
                            const SizedBox(height: 4),
                            Text(
                              'Reviewed by ${review['reviewerName']}',
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFF254336)),
                            ),
                          ],
                        ),
                        trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(5, (index) {
                              return Icon(
                                index < review['rating']
                                    ? Icons.star
                                    : Icons.star_border,
                                color: index < review['rating']
                                    ? const Color.fromARGB(255, 235, 200, 2)
                                    : Colors.white,
                              );
                            })));
                  }).toList() ??
                  [],
            ),
          ],
        ),
      ),
    );
  }
}
