import 'package:flutter/material.dart';
import 'package:sanayi_turbo/interface/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:sanayi_turbo/interface/pages/add_product_page.dart';
import 'package:sanayi_turbo/interface/pages/cart_page.dart';
import 'package:sanayi_turbo/interface/pages/favorites_page.dart';
import 'package:sanayi_turbo/interface/pages/home_page.dart';
import 'package:sanayi_turbo/interface/pages/user_ditail_page.dart';
import 'package:sanayi_turbo/interface/screens/sign_up_screen.dart';
import 'package:sanayi_turbo/colors/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Image.asset('assets/images/girisFoto.jpeg'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'SANAYİ GO',
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen geçerli bir mail giriniz!';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Kullanıcı adı yada eposta',
                        hintText: 'Kullanıcı adı veya abc@gmail.com vb.',
                        filled: true,
                        fillColor: Colors.grey,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey), // Odaklandığında çizgi rengi
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Colors.grey), // Odaklanmadığında çizgi rengi
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 12, bottom: 0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen geçerli bir şifre giriniz!';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Şifre',
                        hintText: 'Güvenli şifreyi girin!',
                        filled: true,
                        fillColor: Colors.grey,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Parolanızı mı unuttunuz?',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: login,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BottomNavBar(
                                page1: const HomePage(),
                                page2: const FavoritesPage(),
                                page3: const AddProductPage(),
                                page4: const CartPage(),
                                page5: UserDitailPage(),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Giriş',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text('HESABIN YOK MU?'),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: login,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignUpScreen()),
                        );
                      },
                      child: const Text(
                        'Üye Ol',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
