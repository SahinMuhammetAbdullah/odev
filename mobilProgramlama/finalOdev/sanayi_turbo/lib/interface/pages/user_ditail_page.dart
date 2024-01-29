import 'package:flutter/material.dart';
import 'package:sanayi_turbo/interface/screens/login_screen.dart';

class UserDitailPage extends StatefulWidget {
  const UserDitailPage({super.key});

  @override
  State<UserDitailPage> createState() => _UserDitailPageState();
}

class _UserDitailPageState extends State<UserDitailPage> {
  // Kullanıcı bilgilerini burada saklayabilirsiniz
  String phoneNumber = '+90 555 555 55 55';
  String address = '123 Main St, City';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profil Bilgisi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              title: Text('Telefon: $phoneNumber'),
            ),
            ListTile(
              title: Text('Adres: $address'),
            ),
            const Divider(),
            const Text(
              'İşlemler',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              title: const Text('Yüklenmiş Ürünlerim'),
              leading: const Icon(Icons.shopping_bag),
              onTap: () {
                // Yüklenmiş ürünler sayfasına gitmek için gerekli navigasyon kodunu buraya ekleyin.
              },
            ),
            ListTile(
              title: const Text('Siparişlerim'),
              leading: const Icon(Icons.shopping_cart),
              onTap: () {
                // Siparişlerim sayfasına gitmek için gerekli navigasyon kodunu buraya ekleyin.
              },
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              child: const Text('Çıkış Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
