class ProductModel {
  final String imageUrl;
  final String title;
  final String price;
  final String originalPrice;
  final String rating;
  final String sold;
  final String store;
  final String discountLabel;

  const ProductModel({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.sold,
    required this.store,
    this.discountLabel = '-50%',
  });
}

List<ProductModel> products = [
  ProductModel(
    imageUrl: 'img_5.png',
    title: 'GR-BK-0081 Sprinkles sprinkle sprinkel 30..',
    price: 'Rp7.500',
    originalPrice: 'Rp15.000',
    rating: '5.0',
    sold: '100',
    discountLabel: '-50%',
    store: 'Yamama Bandung',
  ),
  ProductModel(
    imageUrl: 'img_6.png',
    title: 'GR-BK-0081 Sprinkles',
    price: 'Rp7.500',
    originalPrice: 'Rp15.000',
    rating: '5.0',
    sold: '999+',
    discountLabel: '-50%',
    store: 'Yamama Surabaya',
  ),
  ProductModel(
    imageUrl: 'img_7.png',
    title: 'GR-BK-0081 Sprinkles',
    price: 'Rp7.500',
    originalPrice: '',
    rating: '',
    sold: '',
    discountLabel: '-50%',
    store: 'Yamama Tangerang',
  ),
  ProductModel(
    imageUrl: 'img_8.png',
    title: 'GR-BK-0081 Sprinkles',
    price: 'Rp7.500',
    originalPrice: '',
    rating: '5.0',
    sold: '999+',
    discountLabel: '-50%',
    store: 'Yamama Surabaya',
  ),
];
