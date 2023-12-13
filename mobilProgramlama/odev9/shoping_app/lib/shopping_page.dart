import 'package:flutter/material.dart';
import 'package:shoping_app/cart_page.dart';
import 'package:shoping_app/login_page.dart';

class ShoppingPage extends StatefulWidget {
  final String username;
  const ShoppingPage({Key? key, required this.username}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState(username: username);
}

class _ShoppingPageState extends State<ShoppingPage> {
  // ignore: unused_element
  _ShoppingPageState({Key? key, required this.username});
  List<String> selectedItems = [];

  final String username;

  @override
  Widget build(BuildContext context) {
    final List<String> imageAssetPaths = [
      'images/1.png',
      'images/2.png',
      'images/3.png',
      'images/4.png',
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Mağazamıza Hoşgeldin $username',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) {
              return Card(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                    Expanded(
                      child: Image.asset(
                        imageAssetPaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedItems.add(imageAssetPaths[index]);
                            });

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Ürün Eklendi'),
                                  content: const Text('Ürün sepete eklendi.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Tamam'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Sepete Ekle'),
                        )),
                  ]));
            },
            itemCount: 4,
          ),
        ),
        drawer: Drawer(
          child: ListView(children: [
            ListTile(
              title: const Text('Sepete Git'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CartPage(selectedItems: selectedItems),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Çıkış Yap'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ]),
        ));
  }
}