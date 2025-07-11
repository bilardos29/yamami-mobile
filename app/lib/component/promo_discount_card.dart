import 'package:flutter/material.dart';

class PromoDiscountCard extends StatelessWidget {
  final String title;
  final String discountLabel;
  final List<Product> products;
  final Color? bgColor;

  const PromoDiscountCard({
    Key? key,
    required this.title,
    required this.discountLabel,
    required this.products,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: bgColor ?? Color(0xFFFFFAF0),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  discountLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              productWidget(
                products[0].imageUrl,
                products[0].discountedPrice,
                products[0].originalPrice,
              ),
              SizedBox(width: 10),
              productWidget(
                products[1].imageUrl,
                products[1].discountedPrice,
                products[1].originalPrice,
              ),
            ],
          ),
        ],
      ),
    );
  }

  productWidget(String img, String discountPrice, String price) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'asset/images/$img',
          width: 72,
          height: 72,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        price,
        style: const TextStyle(
          decoration: TextDecoration.lineThrough,
          color: Colors.grey,
          fontSize: 7,
        ),
      ),
      const SizedBox(height: 2),
      Text(
        discountPrice,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.black87,
        ),
      ),
    ],
  );
}

class Product {
  final String imageUrl;
  final String originalPrice;
  final String discountedPrice;

  Product({
    required this.imageUrl,
    required this.originalPrice,
    required this.discountedPrice,
  });
}
