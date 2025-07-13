import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfilePrivacyPolicyPage extends StatefulWidget {
  const ProfilePrivacyPolicyPage({super.key});

  @override
  State<ProfilePrivacyPolicyPage> createState() =>
      _ProfilePrivacyPolicyPageState();
}

class _ProfilePrivacyPolicyPageState extends State<ProfilePrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Kebijakan Privasi'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _privacySection(
            title: 'Privasi Anda, Prioritas Kami',
            content:
                'Setiap detail informasi yang Anda berikan adalah tanggung jawab besar bagi kami. Kami berkomitmen untuk menjaga dan melindungi data Anda dengan integritas tinggi, karena kepercayaan Anda adalah dasar hubungan kami. Sama seperti Anda mempercayakan kebutuhan mengenai Anda kepada kami, kami berkomitmen untuk menjaga privasi Anda dengan standar tertinggi.',
          ),
          SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                _privacySection(
                  title: 'Pengumpulan Informasi',
                  content:
                      'Kami dapat mengumpulkan informasi seperti nama Anda, alamat email, alamat rumah, nomor telepon, dan data pembayaran. Informasi ini digunakan hanya untuk memproses pesanan Anda, memberikan layanan pelanggan, dan meningkatkan pengalaman belanja Anda di X Yamama.',
                ),
                SizedBox(height: 16),
                _privacySection(
                  title: 'Penggunaan Informasi',
                  content:
                      'Informasi Anda, baik publik maupun pribadi, tidak akan dijual, ditukar, dipindahkan, atau diberikan kepada perusahaan lain tanpa persetujuan Anda, kecuali untuk tujuan jelas mengirimkan produk atau layanan yang diminta.',
                ),
                SizedBox(height: 16),
                _privacySection(
                  title: 'Keamanan Informasi',
                  content:
                      'Kami menerapkan berbagai langkah keamanan untuk menjaga keamanan informasi pribadi Anda saat Anda melakukan pemesanan atau mengakses informasi pribadi Anda.',
                ),
                SizedBox(height: 16),
                _privacySection(
                  title: 'Pihak Ketiga',
                  content:
                      'Kami tidak menjual, memperdagangkan, atau mentransfer informasi pribadi Anda kepada pihak ketiga. Ini tidak termasuk pihak ketiga yang terpercaya yang membantu kami dalam mengoperasikan situs web kami atau melayani Anda, selama pihak tersebut setuju untuk menjaga informasi ini tetap rahasia.',
                ),
                SizedBox(height: 16),
                _privacySection(
                  title: 'Persetujuan Anda',
                  content:
                      'Dengan menggunakan situs kami, Anda menyetujui kebijakan privasi kami.',
                ),
                SizedBox(height: 16),
                _privacySection(
                  title: 'Perubahan pada Kebijakan Privasi',
                  content:
                      'Kami berhak untuk mengubah kebijakan privasi ini sesuai kebutuhan. Perubahan akan diumumkan di halaman ini.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _privacySection({String? title, String? content}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title ?? '',
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      SizedBox(height: 8),
      Text(
        content ?? '',
        style: TextStyle(height: 1.5, fontSize: 12, color: Color(0xff8C867D)),
      ),
    ],
  );
}
