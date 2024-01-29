import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_turbo/data/entity/products.dart';
import 'package:sanayi_turbo/data/repo/productdao_repository.dart';

class AddProductPageCubit extends Cubit<List<Product>> {
  AddProductPageCubit() : super([]);

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController categoriesController = TextEditingController();

  var aprepo = ProductDaoRepository();

  Future<void> createProduct() async {
    var product = Product(
      id: '0', // You need to set a proper ID, assuming 0 for now
      name: nameController.text,
      description: descriptionController.text,
      price: priceController.text,
      imageUrl: imageUrlController.text,
      categories: categoriesController.text,
    );
    print(
        '${product.name}-${product.description}-${product.price}-${product.imageUrl} ');

    var updatedProducts = await aprepo.createProduct(product);
    emit(updatedProducts);
  }
}
