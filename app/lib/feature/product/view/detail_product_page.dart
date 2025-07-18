import 'package:app/component/bottom_dialog.dart';
import 'package:app/component/product_card.dart';
import 'package:app/feature/home/model/product_model.dart';
import 'package:app/feature/product/view/list_review_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../transaction/view/widgets/review_card.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          buildIconWithBadge(image: 'ic_cart.png', onTap: () {}),
          const SizedBox(width: 8),
          buildIconWithBadge(
            image: 'ic_share.png',
            withRedDot: false,
            onTap: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'asset/images/img_5.png',
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GR-BK-0081 Sprinkles sprinkle sprinkle 30..',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Chip(
                        label: Text(
                          '-50%',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                        visualDensity: VisualDensity.compact,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Rp7.500',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Rp15.000',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildVariationButton('Variasi 1', isSelected: true),
                      _buildVariationButton('Variasi 2'),
                      _buildVariationButton('Variasi 3'),
                      SizedBox(
                        width: 50,
                        child: btnBottom('+3', isBorderButton: true),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  ExpansionTile(
                    title: const Text("Deskripsi"),
                    tilePadding: EdgeInsets.zero,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor incididunt utau labore et dolore magna aliqua.Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor',
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("Informasi Lainnya"),
                    tilePadding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Informasi lainnya di sini...'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          'asset/images/img_usr_1.png',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Yamama Bandung'),
                          Text('Kota Bandung'),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 120,
                        child: btnBottom('Kunjungi Toko', isBorderButton: true),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 20),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ulasan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          nextPage(context, ListReviewPage());
                        },
                        child: Text(
                          "Lihat Semua",
                          style: TextStyle(color: Color(0xffB4870F)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ReviewCard(),
                  const SizedBox(height: 24),
                  const Text(
                    "Produk Terkait",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  _buildRelatedProduct(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.grey,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: btnBottom(
                'Beli Sekarang',
                isBorderButton: true,
                onClick: () => showAddToCartBottomSheet(context, 'Buy'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: btnBottom(
                '+ Keranjang',
                onClick: () => showAddToCartBottomSheet(context, 'Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget btnBottom(
    String txt, {
    bool isBorderButton = false,
    VoidCallback? onClick,
  }) => InkWell(
    onTap: onClick,
    child: Container(
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isBorderButton ? Colors.white : Color(0xffB4870F),
        border:
            !isBorderButton
                ? null
                : Border.all(color: Color(0xffB4870F), width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        txt,
        style: TextStyle(
          color: isBorderButton ? Color(0xffB4870F) : Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  Widget _buildVariationButton(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Container(
        height: 44,
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Color(0xffFFF4BA) : Colors.white,
          border: Border.all(
            color: isSelected ? Color(0xffB4870F) : Colors.black45,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Color(0xffB4870F) : Colors.black45,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildRelatedProduct() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            products.map((product) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(
                  product: product,
                  maxlines: 1,
                  onClick: () => nextPage(context, DetailProductPage()),
                ),
              );
            }).toList(),
      ),
    );
  }
}
