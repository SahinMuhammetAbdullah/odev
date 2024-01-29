import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavBar extends StatefulWidget {
  final Widget page1;
  final Widget page2;
  final Widget page3;
  final Widget page4;
  final Widget page5;

  const BottomNavBar({
    super.key,
    required this.page1,
    required this.page2,
    required this.page3,
    required this.page4,
    required this.page5,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);
    return Scaffold(
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black, // Seçilen öğenin etiket rengi
        unselectedItemColor: Colors.grey, // Seçilmemiş öğenin etiket rengi
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: d!.homepage,
            backgroundColor: Colors.grey[400],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            label: d.favorites,
            backgroundColor: Colors.grey[400],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
            label: d.addProduct,
            backgroundColor: Colors.grey[400],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            label: d.cart,
            backgroundColor: Colors.grey[400],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: d.login,
            backgroundColor: Colors.grey[400],
          ),
        ],
      ),
    );
  }

  Widget _getPage() {
    switch (_currentIndex) {
      case 0:
        return widget.page1;
      case 1:
        return widget.page2;
      case 2:
        return widget.page3;
      case 3:
        return widget.page4;
      case 4:
        return widget.page5;
      default:
        return Container(); // Hata durumunda boş bir widget döndürülebilir.
    }
  }
}
