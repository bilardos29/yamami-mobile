import 'package:app/feature/transaction/view/detail_transaction_page.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final OrderStatus status;

  const ProductView({required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _productTile(
            shop: "Toko Bandung",
            product: "GR-BK-0081 Sprinkles sprinkle Sprinkles spring...",
            detail: "Kuning - Size 2",
            note: "Tolong dipacking dengan baik",
            price: "Rp 7.500",
            image: 'img_5.png',
          ),
          if (status == OrderStatus.waitingPayment ||
              status == OrderStatus.canceled)
            _productTile(
              shop: "Toko Jawa",
              product: "GR-BK-0081 Sprinkles spring...",
              detail: "Kuning - Size 2",
              price: "Rp 7.500",
              image: 'img_5.png',
            ),
        ],
      ),
    );
  }

  Widget _productTile({
    required String shop,
    required String product,
    required String detail,
    required String price,
    required String image,
    String? note,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                'asset/images/img_test.jpg',
                width: 28,
                height: 28,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Text(shop, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'asset/images/$image',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product, overflow: TextOverflow.ellipsis),
                  const SizedBox(width: 4),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detail,
                            style: TextStyle(color: Color(0xff8C867D)),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            price,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      if (status == OrderStatus.canceled)
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFB4870F),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            "Beli Lagi",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        if (note != null) ...[
          Text(
            "Catatan: $note",
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Divider(),
          ),
        ],
      ],
    );
  }
}
