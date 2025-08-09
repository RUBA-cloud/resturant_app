class CartItemModel {
  final String name;
  final String desc;
  final double price;
  double quantity;
  final String image;

  CartItemModel({
    required this.name,
    required this.desc,
    required this.price,
    required this.image,
    required this.quantity,
  });
}
