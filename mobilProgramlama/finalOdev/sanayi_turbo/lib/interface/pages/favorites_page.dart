import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_turbo/data/entity/products.dart';
import 'package:sanayi_turbo/interface/cubit/pages_cubit/favorites_page_cubit.dart';
import 'package:sanayi_turbo/interface/pages/detail_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritePageCubit>().bringFavoriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favori Ürünler'),
      ),
      body: BlocBuilder<FavoritePageCubit, List<Product>>(
        builder: (context, favoriteProducts) {
          if (favoriteProducts.isNotEmpty) {
            return ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                var favoriteProduct = favoriteProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  product: favoriteProduct,
                                ))).then((value) {
                      context.read<FavoritePageCubit>().bringFavoriteProducts();
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 100,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favoriteProduct.name,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(favoriteProduct.price),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "${favoriteProduct.name} favorilerden silinsin mi?",
                                style: TextStyle(color: Colors.black),
                              ),
                              backgroundColor: Colors.grey[400],
                              action: SnackBarAction(
                                label: "Evet",
                                textColor: Colors.black,
                                onPressed: () {
                                  context
                                      .read<FavoritePageCubit>()
                                      .removeFavorite(favoriteProduct.id);

                                  // Ürün favorilerden silindiğinde beğeni durumunu güncelle
                                  setState(() {
                                    favoriteProduct.isLiked =
                                        !favoriteProduct.isLiked;
                                  });
                                },
                              ),
                            ));
                          },
                          icon: Icon(
                            favoriteProduct.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: favoriteProduct.isLiked
                                ? Colors.red
                                : Colors.black54,
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Favori ürün bulunamadı.'),
            );
          }
        },
      ),
    );
  }
}
