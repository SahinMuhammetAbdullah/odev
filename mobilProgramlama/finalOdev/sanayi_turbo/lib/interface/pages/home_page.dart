import 'package:flutter/material.dart';
import 'package:sanayi_turbo/data/entity/categories.dart';
import 'package:sanayi_turbo/interface/screens/category_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);
    final List<String> categories = [
      d!.car,
      d.chemical,
      d.glass,
      d.food,
      d.machine,
      d.cement,
    ];

    var categoriesImages = Categories();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tedarik Turbo'),
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Bildirim ikonuna tıklama işlemleri
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search),
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Resme basıldığında CategoryScreen'e geç
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CategoryScreen(category: categories[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10.0), // Kenar yuvarlama miktarını ayarlayın
                          child: Image.asset(
                            'assets/images/${categoriesImages.getCategoryByIndex(index)}.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 120,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        categories[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
