import 'package:flutter/material.dart';
import '../models/supply.dart';

class SupplyListItem extends StatelessWidget {
  final Supply supply;
  final VoidCallback onTap;

  const SupplyListItem({
    Key? key,
    required this.supply,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: supply.imageUrls.isNotEmpty
            ? Image.network(supply.imageUrls.first,
                fit: BoxFit.cover, width: 50, height: 50)
            : SizedBox(
                width: 50, height: 50), // Placeholder in case there's no image
        title: Text(supply.productName),
        subtitle: Text(supply.category),
        trailing: Text('\$${supply.price.toStringAsFixed(2)}'),
        onTap: onTap,
      ),
    );
  }
}
