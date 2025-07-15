import 'package:flutter/material.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        actions: [
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar Produk
            Image.asset(
              'asset/images/img_5.png',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            // Informasi Produk
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GR-BK-0081 Sprinkles sprinkle sprinkle 30..',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Chip(
                        label: Text('-50%', style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.red,
                        visualDensity: VisualDensity.compact,
                      ),
                      SizedBox(width: 8),
                      Text('Rp7.500',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(width: 8),
                      Text('Rp15.000',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Variasi Produk
                  Row(
                    children: [
                      _buildVariationButton('Variasi 1'),
                      _buildVariationButton('Variasi 2'),
                      _buildVariationButton('Variasi 3'),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('+3'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          elevation: 0,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 24),
                  const Divider(),

                  // Deskripsi dan Informasi
                  ExpansionTile(
                    title: const Text("Deskripsi"),
                    children: const [Padding(padding: EdgeInsets.all(8.0), child: Text('Deskripsi produk di sini...'))],
                  ),
                  ExpansionTile(
                    title: const Text("Informasi Lainnya"),
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage('asset/images/img_6.png'),
                        ),
                        title: const Text('Yamama Bandung'),
                        subtitle: const Text('Kota Bandung'),
                        trailing: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Kunjungi Toko"),
                        ),
                      )
                    ],
                  ),

                  const Divider(),

                  // Ulasan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Ulasan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("Lihat Semua", style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('asset/images/img_7.png'),
                    ),
                    title: const Text('Bessie Cooper'),
                    subtitle: const Text("11 Februari 2023"),
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Text('5.0'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor incididunt...',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Produk Terkait
                  const Text("Produk Terkait", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 210,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (_, index) => _buildRelatedProduct(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Tombol Bawah
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          children: [
            Icon(Icons.favorite_border, color: Colors.grey),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text('Beli Sekarang'),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow[700]),
              child: const Text('+ Keranjang'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildVariationButton(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(label),
      ),
    );
  }

  Widget _buildRelatedProduct() {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'asset/images/img_6.png',
            height: 100,
            width: 140,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'GR-BK-0081 Sprinkles sprinkle sprinkle 30..',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('Rp7.500', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('Yamama Bandung', style: TextStyle(fontSize: 12, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
