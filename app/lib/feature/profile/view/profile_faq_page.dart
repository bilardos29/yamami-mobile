import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileFaqPage extends StatefulWidget {
  const ProfileFaqPage({super.key});

  @override
  State<ProfileFaqPage> createState() => _ProfileFaqPageState();
}

class _ProfileFaqPageState extends State<ProfileFaqPage> {
  final List<Map<String, String>> faqs = [
    {
      'question': 'Apakah produk tersedia?',
      'answer':
      'Semua produk yang ditampilkan siap. Jika Anda ingin membeli dalam jumlah besar, silakan hubungi nomor WhatsApp yang tertera.',
      'expanded': 'false',
    },
    {
      'question':
      'Apakah harga yang tertera untuk produk sudah termasuk ongkos kirim?',
      'answer': 'Semua produk yang ditampilkan siap.',
      'expanded': 'false',
    },
    {
      'question': 'Apakah produk bisa tiba dalam sehari?',
      'answer': 'Semua produk yang ditampilkan siap.',
      'expanded': 'false',
    },
    {
      'question':
      'Setelah saya melakukan pemesanan, kapan pesanan saya akan diproses?',
      'answer': 'Semua produk yang ditampilkan siap.',
      'expanded': 'false',
    },
    {
      'question':
      'Bagaimana jika saya sudah membayar semua pesanan saya, tetapi barangnya habis?',
      'answer': 'Semua produk yang ditampilkan siap.',
      'expanded': 'false',
    },
    {
      'question':
      'Bagaimana jika saya secara tidak sengaja membeli barang yang salah, apakah bisa ditukar?',
      'answer': 'Semua produk yang ditampilkan siap.',
      'expanded': 'false',
    },
    {
      'question':
      'Jika saya ingin mengubah/menambah barang dalam pesanan saya, apakah itu mungkin?',
      'answer': 'Semua produk yang ditampilkan siap.',
      'expanded': 'false',
    },
    {
      'question':
      'Jika pesanan yang saya terima tidak sesuai dengan pesanan saya, apakah bisa dikembalikan?',
      'answer': 'Semua produk yang ditampilkan siap.',
      'expanded': 'false',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: appText('Bantuan'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide.none,
                horizontal: BorderSide(color: Colors.black54, width: 0.5),
              ),
            ),
            height: 58,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari topik',
                prefixIcon: Icon(Icons.search, size: 20),
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: faqs.length,
              separatorBuilder: (_, __) => Divider(height: 1),
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return ExpansionTile(
                  onExpansionChanged: (bool expanded) {
                    setState(() {
                      faq['expanded'] = '$expanded';
                    });
                  },
                  title: Text(
                    faq['question']!,
                    style: TextStyle(
                      color:
                      faq['expanded'] == 'true'
                          ? Theme
                          .of(context)
                          .primaryColor
                          : Colors.black87,
                    ),
                  ),
                  children:
                  faq['answer']!.isNotEmpty
                      ? [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          faq['answer']!,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  ]
                      : [],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openWhatsApp('082130427999', 'Selamat datang di Yamami Baking');
        },
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        shape: CircleBorder(),
        child: Image.asset('asset/icons/ic_chat.png', width: 20, height: 20),
      ),
    );
  }

  void openWhatsApp(String phone, String message) async {
    final uri = Uri.parse(
        "https://wa.me/$phone?text=${Uri.encodeFull(message)}");

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }
}
