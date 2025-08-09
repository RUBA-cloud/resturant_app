class ProductModel {
  final String id, categoryId;
  final String nameEn, nameAr;
  final String description;
  final double price;
  final String image;
  final double rate;
  final bool isPopular;

  ProductModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.categoryId,
    required this.description,
    required this.price,
    required this.rate,
    required this.image,
    required this.isPopular,
  });
}
