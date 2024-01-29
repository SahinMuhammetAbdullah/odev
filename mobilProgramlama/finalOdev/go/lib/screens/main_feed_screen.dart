// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_supply_screen.dart';
import 'supply_details_screen.dart';

class MainFeedScreen extends StatefulWidget {
  const MainFeedScreen({Key? key, }) : super(key: key);

  @override
  _MainFeedScreenState createState() => _MainFeedScreenState();
}

class _MainFeedScreenState extends State<MainFeedScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildSupplyItem(BuildContext context, DocumentSnapshot document) {
    // Bu fonksiyon ile her bir tedarik öğesinin UI'ını oluşturabilirsiniz.
    // Örnek olarak basit bir ListTile kullanıyorum.
    return ListTile(
      title: Text(document['productName']),
      subtitle: Text(document['category']),
      trailing: Text('\$${document['price']}'),
      onTap: () {
        // Tedarik detay ekranına yönlendirme
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SupplyDetailsScreen(supplyId: document.id),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const AddSupplyScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Profil Bilgisi ve Arama Çubuğu
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      // Arama işlevi için bir event tetikleyebilirsiniz.
                    },
                  ),
                ),
              ],
            ),
          ),
          // Tedarik Listesi
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('supplies').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return _buildSupplyItem(context, document);
                      }).toList(),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
