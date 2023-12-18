import 'package:flutter/material.dart';
import 'package:shoping_app/shopping_page.dart'; // Mağaza sayfasının dosya adını ve yolunu ayarlayın.

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
                // Mağaza sayfasına git butonu
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ShoppingPage()), // Mağaza sayfasının örneğini oluşturun
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
