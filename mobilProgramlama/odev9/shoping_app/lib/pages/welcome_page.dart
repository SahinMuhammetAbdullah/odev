import 'package:flutter/material.dart';
import 'package:shoping_app/pages/shopping_page.dart'; 

class WelcomePage extends StatelessWidget {
  final String username;

  WelcomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoşgeldin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hoşgeldin, $username!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ShoppingPage()),
                );
              },
              child: Text('Mağaza Sayfasına Git'),
            ),
          ],
        ),
      ),
    );
  }
}
