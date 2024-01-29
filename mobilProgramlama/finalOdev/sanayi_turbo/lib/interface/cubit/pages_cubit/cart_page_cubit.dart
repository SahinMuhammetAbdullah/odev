import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_turbo/data/entity/products.dart';
import 'package:sanayi_turbo/data/repo/productdao_repository.dart';

class CartPageCubit extends Cubit<List<Product>> {
  final ProductDaoRepository crepo = ProductDaoRepository();

  CartPageCubit() : super([]);

  Future<void> bringCartProducts() async {
    final List<Product> list = await crepo.bringCartProducts();
    emit(list);
  }

  Future<void> addToCart(String id) async {
    await crepo.addToCart(id);
    await bringCartProducts();
  }

  Future<void> removeFromCart(String id) async {
    await crepo.removeFromCart(id);
    await bringCartProducts();
  }
}
