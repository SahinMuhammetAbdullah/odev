import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<String> selectedItems;

  const CartPage({Key? key, required this.selectedItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> itemCounts = [];

  @override
  void initState() {
    super.initState();
    itemCounts = List<int>.generate(widget.selectedItems.length, (index) => 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetiniz'),
      ),
      body: ListView.builder(
        itemCount: widget.selectedItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(widget.selectedItems[index]),
            title: Text(''),
            subtitle: Text('Adet: ${itemCounts[index]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (itemCounts[index] > 0) {
                      setState(() {
                        itemCounts[index]--;
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      itemCounts[index]++;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.selectedItems.removeAt(index);
                      itemCounts.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
