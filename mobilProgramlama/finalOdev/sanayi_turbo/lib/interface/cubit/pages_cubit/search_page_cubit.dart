import 'package:sanayi_turbo/data/entity/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_turbo/data/repo/productdao_repository.dart';

class SearchPageCubit extends Cubit<List<Product>> {
  SearchPageCubit() : super(<Product>[]);

  var srepo = ProductDaoRepository();

  Future<void> bringProducts() async {
    var list = await srepo.bringProducts();
    emit(list);
  }

  Future<void> search(String searchWords) async {
    var list = await srepo.search(searchWords);
    emit(list);
  }
}
