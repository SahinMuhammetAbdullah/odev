import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<String> selectedItems;

  const CartPage({Key? key, required this.selectedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetiniz'),
      ),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(selectedItems[index]),
            title: Text(selectedItems[index]),
          );
        },
      ),
    );
  }
}
