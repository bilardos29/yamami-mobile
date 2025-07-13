import 'package:app/component/custom_border_button.dart';
import 'package:app/component/notif_promo_card.dart';
import 'package:app/component/notif_transaction_card.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int selectedIndex = 0;

  final List<String> options = ['Transaksi', 'Promo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Notification'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Row(
                children: List.generate(options.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CustomBorderButton(
                      label: options[index],
                      isSelected: selectedIndex == index,
                      onPressed: () {
                        setState(() => selectedIndex = index);
                      },
                    ),
                  );
                }),
              ),
              if (selectedIndex == 0)
                transaction,
              if (selectedIndex == 1) Column(
                children: [
                  SizedBox(height: 12),
                  PromoNotificationCard(
                    title: "Diskon s.d 100rb, sampe 1.2 JT!",
                    description: "Semua lengkap + ada bebas ongkir Rp 0 juga untuk setiap transaksi. Yuk, belanja sekarang!",
                    time: "15 Menit lalu",
                  ),
                  SizedBox(height: 12),
                  PromoNotificationCard(
                    title: "Diskon s.d 350rb, sampe 2.5 JT!",
                    description: "Semua lengkap + ada bebas ongkir Rp 0 juga untuk setiap transaksi. Yuk, belanja sekarang!",
                    time: "30 Menit lalu",
                  ),
                  SizedBox(height: 12),
                  PromoNotificationCard(
                    title: "Diskon s.d 500rb, sampe 5.4 JT!",
                    description: "Semua lengkap + ada bebas ongkir Rp 0 juga untuk setiap transaksi. Yuk, belanja sekarang!",
                    time: "45 Menit lalu",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get transaction => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 12),
      Text(
        'Terbaru',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 12),
      TransactionNotificationCard(
        status: TransactionStatus.waitingPayment,
        title: 'Menunggu Pembayaran',
        message:
        'Produk yang kamu pilih sedang menunggu untuk dibayar. Mohon melakukan pembayaran sebelum:',
        time: '15 Menit lalu',
        dateText:
        '24:00 WIB, 15 Agustus 2024',
        onActionPressed: () {
        },
      ),
      TransactionNotificationCard(
        status: TransactionStatus.paymentSuccess,
        title: 'Pembayaran Berhasil',
        message:
        'Pembayaranmu sudah kami terima, mohon tunggu konfirmasi selanjutnya.',
        time: '30 Menit lalu',
        onActionPressed: () {
        },
      ),
      TransactionNotificationCard(
        status: TransactionStatus.onProcess,
        title: 'Pesananmu sedang diproses',
        time: '30 Menit lalu',
        imageUrl: 'img_5.png',
        itemTitle:
        'GR-BK-0081 Sprinkles sprinkle sprinkle 30...',
        actionText: 'Detail',
        onActionPressed: () {
          // Arahkan ke halaman detail pesanan
        },
      ),
      SizedBox(height: 12),
      Text(
        'Sebelumnya',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 12),
      TransactionNotificationCard(
        status: TransactionStatus.onDelivery,
        title: 'Pesananmu sedang dikirim',
        time: '1 Hari lalu',
        imageUrl: 'img_5.png',
        itemTitle:
        'GR-BK-0081 Sprinkles sprinkle sprinkle 30...',
        actionText: 'Lacak',
        onActionPressed: () {
          // Arahkan ke halaman detail pesanan
        },
      ),
      TransactionNotificationCard(
        status: TransactionStatus.done,
        title: 'Pesananmu sudah selesai, beri ulasan 🎉',
        time: '1 Hari lalu',
        imageUrl: 'img_5.png',
        itemTitle:
        'GR-BK-0081 Sprinkles sprinkle sprinkle 30...',
        actionText: 'Ulas',
        onActionPressed: () {
          // Arahkan ke halaman detail pesanan
        },
      ),
    ],
  );

  Widget get empty =>
      emptyState(title: 'Notifikasi', detail: 'pemberitahuan', () {
        nextPage(context, Container());
      });
}
