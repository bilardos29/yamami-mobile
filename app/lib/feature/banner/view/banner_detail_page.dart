import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BannerDetailPage extends StatelessWidget {
  final String image;
  const BannerDetailPage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    const promoTitle = "Diskon Promo 5.5";
    const promoDate = "17 Desember 2025";
    const promoCode = "87847879478984989";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Banner"),
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "asset/banner/$image",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              promoTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              "Berlaku sampai $promoDate",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            const Text(
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. "
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries.",
              style: TextStyle(height: 1.5),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const Text("Kode Promo", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      promoCode,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(const ClipboardData(text: promoCode));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Kode promo berhasil disalin!"),
                      ),
                    );
                  },
                  child: const Text(
                    "Copy",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const Text(
              "Syarat dan Ketentuan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and",
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Lorem ipsum is placeholder text commonly used in the graphic, print,",
                  ),
                  SizedBox(height: 4),
                  Text(
                    "2. Lorem ipsum is placeholder text commonly used in the graphic, print,",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
