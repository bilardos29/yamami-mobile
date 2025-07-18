class CartItem {
  final String store;
  final String storeImage;
  final String name;
  final String variant;
  final double price;
  final double? originalPrice;
  final String image;
  int quantity;
  bool selected;

  CartItem({
    required this.store,
    required this.storeImage,
    required this.name,
    required this.variant,
    required this.price,
    this.originalPrice,
    required this.image,
    this.quantity = 1,
    this.selected = false,
  });
}