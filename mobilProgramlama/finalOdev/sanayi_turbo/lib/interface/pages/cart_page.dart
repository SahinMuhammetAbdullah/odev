import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_turbo/data/entity/products.dart';
import 'package:sanayi_turbo/interface/cubit/pages_cubit/cart_page_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alışveriş Sepeti'),
      ),
      body: BlocBuilder<CartPageCubit, List<Product>>(
        builder: (context, cartList) {
          return cartList.isEmpty
              ? Center(
                  child: Text('Sepetiniz boş.'),
                )
              : ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cartList[index].name),
                      subtitle:
                          Text('Fiyat: \$${cartList[index].price.toString()}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart),
                        onPressed: () {
                          context
                              .read<CartPageCubit>()
                              .removeFromCart(cartList[index].id);
                        },
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CartPageCubit>().addToCart("productId");
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
