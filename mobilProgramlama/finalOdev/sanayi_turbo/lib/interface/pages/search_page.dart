import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_turbo/data/entity/products.dart';
import 'package:sanayi_turbo/interface/cubit/pages_cubit/search_page_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    context.read<SearchPageCubit>().bringProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                  context.read<SearchPageCubit>().search(searchResult);
                },
              )
            : const Text("Ürünler"),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                    context.read<SearchPageCubit>().bringProducts();
                  },
                  icon: const Icon(Icons.clear),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                )
        ],
      ),
      body: BlocBuilder<SearchPageCubit, List<Product>>(
          builder: (context, productsList) {
        if (productsList.isNotEmpty) {
          return ListView.builder(
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                var product = productsList[index];
                return GestureDetector(
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
                                product.name,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(product.price),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              });
        } else {
          return const Center();
        }
      }),
    );
  }
}
