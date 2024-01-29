class Supply {
  final String id;
  final String productName;
  final double price;
  final String category;
  final List<String> imageUrls;

  Supply({
    required this.id,
    required this.productName,
    required this.price,
    required this.category,
    required this.imageUrls,
  });

  factory Supply.fromMap(Map<String, dynamic> data, String documentId) {
    return Supply(
      id: documentId,
      productName: data['productName'] ?? '',
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      category: data['category'] ?? '',
      imageUrls: List<String>.from(data['imageUrls'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'price': price,
      'category': category,
      'imageUrls': imageUrls,
    };
  }
}
