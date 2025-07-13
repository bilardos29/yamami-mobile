import 'package:app/component/custom_border_button.dart';
import 'package:app/component/transaction_card.dart';
import 'package:app/feature/cart/view/cart_page.dart';
import 'package:app/feature/home/view/header_menu.dart';
import 'package:app/feature/notification/view/notification_page.dart';
import 'package:app/feature/transaction/view/detail_transaction_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  final orders = [
    {
      'status': 'Menunggu Pembayaran',
      'statusColor': Colors.orange,
      'timeLimit': '24:00 WIB, 15 Agustus 2024',
    },
    {'status': 'Diproses', 'statusColor': Colors.blue, 'timeLimit': ''},
    {'status': 'Dalam Pengiriman', 'statusColor': Colors.lightBlue},
    {'status': 'Selesai', 'statusColor': Colors.green, 'timeLimit': ''},
    {'status': 'Dibatalkan', 'statusColor': Colors.grey, 'timeLimit': ''},
  ];

  int selectedIndex = 0;

  final List<String> options = [
    'Semua',
    'Menunggu Pembayaran',
    'Diproses',
    'Dalam Pengiriman',
    'Selesai',
    'Dibatalkan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: HeaderMenu(
                title: 'Pesanan',
                onNotificationTap: () => nextPage(context, NotificationPage()),
                onCartTap: () => nextPage(context, CartPage()),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
            ),
            SizedBox(height: 12),
            Column(
              children: [
                TransactionCard(
                  status: 'Menunggu Pembayaran',
                  statusColor: Colors.orange,
                  storeName: 'Toko Bandung',
                  productName: 'GR-BK-0081 Sprinkles sprinkle....',
                  quantity: 'x1',
                  additional: '+1 produk lainnya',
                  total: 'Rp 13.000',
                  onClick: (){
                    nextPage(context, OrderDetailPage(status: OrderStatus.waitingPayment));
                  },
                ),
                TransactionCard(
                  status: 'Diproses',
                  statusColor: Colors.blue,
                  invoice: 'INV12349898989',
                  storeName: 'Toko Bandung',
                  productName: 'GR-BK-0081 Sprinkles sprinkle....',
                  quantity: 'x1',
                  additional: '+1 produk lainnya',
                  total: 'Rp 13.000',
                  onClick: (){
                    nextPage(context, OrderDetailPage(status: OrderStatus.processed));
                  },
                ),
                TransactionCard(
                  status: 'Dalam Pengiriman',
                  statusColor: Colors.blue,
                  invoice: 'INV12349898989',
                  storeName: 'Toko Bandung',
                  productName: 'GR-BK-0081 Sprinkles sprinkle....',
                  quantity: 'x1',
                  additional: '+1 produk lainnya',
                  total: 'Rp 13.000',
                  onClick: (){
                    nextPage(context, OrderDetailPage(status: OrderStatus.shipped));
                  },
                ),
                TransactionCard(
                  status: 'Selesai',
                  statusColor: Colors.green,
                  invoice: 'INV12349898989',
                  storeName: 'Toko Bandung',
                  productName: 'GR-BK-0081 Sprinkles sprinkle....',
                  quantity: 'x1',
                  additional: '+1 produk lainnya',
                  total: 'Rp 13.000',
                  onClick: (){
                    nextPage(context, OrderDetailPage(status: OrderStatus.completed));
                  },
                ),
                TransactionCard(
                  status: 'Dibatalkan',
                  statusColor: Colors.grey,
                  storeName: 'Toko Bandung',
                  productName: 'GR-BK-0081 Sprinkles sprinkle....',
                  quantity: 'x1',
                  additional: '+1 produk lainnya',
                  total: 'Rp 13.000',
                  onClick: (){
                    nextPage(context, OrderDetailPage(status: OrderStatus.canceled));
                  },
                ),
                SizedBox(height: 100),
              ],
            ),

            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: orders.length,
            //   itemBuilder: (context, index) {
            //     final order = orders[index];
            //     return TransactionCard(
            //       shopName: 'Toko Bandung',
            //       productImageUrl: 'asset/images/img_6.png',
            //       productTitle: 'GR-BK-0081 Sprinkles sprinkle...',
            //       totalPrice: 13000,
            //       dueDate: '${order['timeLimit']!}',
            //     );
          ],
        ),
      ),
    );
  }
}
