import 'package:sanayi_turbo/data/entity/products.dart';

class ProductDaoRepository {
  Future<List<Product>> bringProducts() async {
    var products = <Product>[];
    products.add(Product(
      id: "22",
      name: "name1",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
    ));
    products.add(Product(
      id: "23",
      name: "name2",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
    ));
    products.add(Product(
      id: "24",
      name: "name3",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
    ));
    return products;
  }

  Future<List<Product>> search(String searchWords) async {
    var products = <Product>[];
    products.add(Product(
      id: "22",
      name: "name",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
    ));
    return products;
  }

  Future<void> addToFavorite(int id) async {
    var products = <Product>[];
    products.add(Product(
      id: "22",
      name: "name",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
      isLiked: true,
    ));
  }

  Future<List<Product>> bringFavoriteProducts() async {
    var products = <Product>[];
    products.add(Product(
      id: "22",
      name: "name1",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
      isLiked: true,
    ));
    products.add(Product(
      id: "23",
      name: "name2",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
      isLiked: true,
    ));
    products.add(Product(
      id: "24",
      name: "name3",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
      isLiked: true,
    ));
    return products;
  }

  Future<void> removeFavorite(String id) async {
    print("favoriden cikar: $id");
  }

  Future<List<Product>> addToCart(String id) async {
    var products = <Product>[];
    products.add(Product(
      id: "24",
      name: "name3",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
      isLiked: true,
    ));
    return products;
  }

  Future<List<Product>> bringCartProducts() async {
    var products = <Product>[];
    products.add(Product(
      id: "22",
      name: "name1",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
    ));
    products.add(Product(
      id: "23",
      name: "name2",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
    ));
    products.add(Product(
      id: "24",
      name: "name3",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
    ));
    return products;
  }

  Future<void> removeFromCart(String id) async {
    print("sepetten cikar: $id");
  }

  Future<List<Product>> createProduct(Product product) async {
    var products = <Product>[];
    products.add(Product(
      id: "22",
      name: "name1",
      description: "description",
      price: "price",
      imageUrl: "imageUrl",
      categories: "categories",
      isLiked: false,
    ));

    // Oluşturulan ürünü kullanabilirsiniz (örneğin, bir veritabanına kaydedebilirsiniz).
    // Bu örnekte yeni ürünü sadece yazdırıyoruz:
    print('Yeni Ürün Oluşturuldu: ${products[0].name}');
    return products;
  }
}
