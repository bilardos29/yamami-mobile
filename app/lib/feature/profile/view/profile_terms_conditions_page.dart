import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfileTermsConditionsPage extends StatefulWidget {
  const ProfileTermsConditionsPage({super.key});

  @override
  State<ProfileTermsConditionsPage> createState() =>
      _ProfileTermsConditionsPageState();
}

class _ProfileTermsConditionsPageState
    extends State<ProfileTermsConditionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Syarat dan Ketentuan'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          _syaratItem(
            title: 'Definisi',
            desc:
                'Isi kebijakan privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda.',
          ),
          SizedBox(height: 20),
          _syaratItem(
            title: 'Transaksi Pembelian',
            desc:
                'Kami berkomitmen untuk memberikan informasi yang jelas dan transparan tentang kebijakan kami.',
          ),
          SizedBox(height: 20),
          _syaratItem(
            title: 'Harga',
            desc:
                'Kami memastikan setiap transaksi dilakukan dengan aman dan efisien.',
          ),
          SizedBox(height: 20),
          _syaratItem(
            title: 'Pilihan Hukum',
            desc:
                'Kami menawarkan harga yang kompetitif untuk semua produk kami.',
          ),
        ],
      ),
    );
  }

  Widget _syaratItem({String? title, String? desc}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Color(0xff271B09),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        desc ?? '',
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xff8C867D),
          height: 1.4,
        ),
      ),
    ],
  );
}
