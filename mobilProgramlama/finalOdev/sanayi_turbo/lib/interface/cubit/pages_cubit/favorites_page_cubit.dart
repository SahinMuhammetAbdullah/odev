import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_turbo/data/entity/products.dart';
import 'package:sanayi_turbo/data/repo/productdao_repository.dart';

class FavoritePageCubit extends Cubit<List<Product>> {
  FavoritePageCubit() : super([]);

  var frepo = ProductDaoRepository();

  Future<void> bringFavoriteProducts() async {
    var liste = await frepo.bringFavoriteProducts();
    emit(liste);
  }

  Future<void> removeFavorite(String id) async {
    await frepo.removeFavorite(id);
    await bringFavoriteProducts();
  }
}
