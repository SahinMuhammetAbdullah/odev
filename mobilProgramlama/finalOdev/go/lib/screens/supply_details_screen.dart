import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/supply.dart';

class SupplyDetailsScreen extends StatelessWidget {
  final String supplyId;

  const SupplyDetailsScreen({Key? key, required this.supplyId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supply Details'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('supplies')
            .doc(supplyId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Supply not found.'));
          }

          final supply = Supply.fromMap(
              snapshot.data!.data() as Map<String, dynamic>, snapshot.data!.id);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Product Name: ${supply.productName}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Price: \$${supply.price.toStringAsFixed(2)}'),
                const SizedBox(height: 8),
                Text('Category: ${supply.category}'),
                const SizedBox(height: 16),
                // Burada diğer tedarik detaylarını göstermek için gerekli widget'ları ekleyebilirsiniz.
                // Örneğin, resimleri veya diğer özellikleri göstermek için widget'lar ekleyebilirsiniz.
              ],
            ),
          );
        },
      ),
    );
  }
}
