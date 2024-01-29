class Product {
  String id;
  String name;
  String description;
  String price;
  String imageUrl;
  String categories;
  bool isLiked;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categories,
    this.isLiked = false,
  });
}
