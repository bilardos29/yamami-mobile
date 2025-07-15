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
      'invoice': '',
      'storeName': 'Toko Bandung',
      'timeLimit': '24:00 WIB, 15 Agustus 2024',
      'productName': 'GR-BK-0081 Sprinkles sprinkle....',
      'quantity': 'x1',
      'additional': '+1 produk lainnya',
      'total': 'Rp 13.000',
    },
    {
      'status': 'Diproses',
      'statusColor': Colors.blue,
      'invoice': 'INV12349898989',
      'storeName': 'Toko Bandung',
      'timeLimit': '',
      'productName': 'GR-BK-0081 Sprinkles sprinkle....',
      'quantity': 'x1',
      'additional': '+1 produk lainnya',
      'total': 'Rp 13.000',
    },
    {
      'status': 'Dalam Pengiriman',
      'statusColor': Colors.lightBlue,
      'invoice': 'INV12349898989',
      'storeName': 'Toko Bandung',
      'timeLimit': '',
      'productName': 'GR-BK-0081 Sprinkles sprinkle....',
      'quantity': 'x1',
      'additional': '+1 produk lainnya',
      'total': 'Rp 13.000',
    },
    {
      'status': 'Selesai',
      'statusColor': Colors.green,
      'invoice': 'INV12349898989',
      'storeName': 'Toko Bandung',
      'timeLimit': '',
      'productName': 'GR-BK-0081 Sprinkles sprinkle....',
      'quantity': 'x1',
      'additional': '+1 produk lainnya',
      'total': 'Rp 13.000',
    },
    {
      'status': 'Dibatalkan',
      'statusColor': Colors.grey,
      'invoice': '',
      'storeName': 'Toko Bandung',
      'timeLimit': '',
      'productName': 'GR-BK-0081 Sprinkles sprinkle....',
      'quantity': 'x1',
      'additional': '+1 produk lainnya',
      'total': 'Rp 13.000',
    },
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

  List<Map<String, Object>> filterList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterList = List.from(orders);
  }

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
                        final selectedOption = options[index];
                        setState(() {
                          if (selectedOption == 'Semua') {
                            filterList = List.from(orders);
                          } else {
                            filterList =
                                orders
                                    .where((e) => e['status'] == selectedOption)
                                    .toList();
                          }

                          selectedIndex = index;
                        });
                      },
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                final order = filterList[index];
                final color =
                    order['status'] == 'Menunggu Pembayaran'
                        ? Colors.orange
                        : order['status'] == 'Diproses'
                        ? Colors.blue
                        : order['status'] == 'Dalam Pengiriman'
                        ? Colors.lightBlue
                        : order['status'] == 'Selesai'
                        ? Colors.green
                        : Colors.grey;
                OrderStatus status =
                    order['status'] == 'Menunggu Pembayaran'
                        ? OrderStatus.waitingPayment
                        : order['status'] == 'Diproses'
                        ? OrderStatus.processed
                        : order['status'] == 'Dalam Pengiriman'
                        ? OrderStatus.shipped
                        : order['status'] == 'Dibatalkan'
                        ? OrderStatus.canceled
                        : OrderStatus.completed;
                return TransactionCard(
                  status: '${order['status']!}',
                  statusColor: color,
                  invoice: '${order['invoice']!}',
                  timeLimit: '${order['timeLimit']!}',
                  storeName: '${order['storeName']!}',
                  productName: '${order['productName']!}',
                  quantity: '${order['quantity']!}',
                  additional: '${order['additional']!}',
                  total: '${order['total']!}',
                  onClick: () {
                    nextPage(context, OrderDetailPage(status: status));
                  },
                );
              },
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
