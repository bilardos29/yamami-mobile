import 'package:app/component/custom_text_button.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/transaction/view/widgets/address_view.dart';
import 'package:app/feature/transaction/view/widgets/detail_payment_view.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

import 'detail_transaction_page.dart';

class CompletedTransactionPage extends StatefulWidget {
  const CompletedTransactionPage({super.key});

  @override
  State<CompletedTransactionPage> createState() =>
      _CompletedTransactionPageState();
}

class _CompletedTransactionPageState extends State<CompletedTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Detail Pesanan'),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        actions: [
          CustomTextButton(text: 'Bantuan', onClick: () {}),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "Selesai",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Lihat Detail",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "INV12349898989",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "15 Agustus 2024",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                const Divider(height: 32),
              ],
            ),
          ),
          AddressView(
            namaPenerima: "Raska Amelia",
            nomorHp: "087878793893",
            alamatLengkap:
                "Rumah - Jalan Supratman No 31, RT 23 RW 23,\nKel.Cibeunying, Kec Cimenyan, Bandung, Jawa barat",
            namaDropshipper: "Raska Amelia",
            nomorDropshipper: "087878793893",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'asset/images/img_5.png',
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
                          Text(
                            'GR-BK-0081 Sprinkles sprinkle....',
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Kuning | Size 2',
                            style: TextStyle(color: Color(0xff8C867D)),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Rp 7.500 x 1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 4),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text("Beli Lagi",style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Catatan: Tolong dipacking dengan baik",
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 16),

                // Review
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor incididunt utau labore et dolore magna aliqua.Lorem ipsum",
                  style: TextStyle(fontSize: 13, height: 1.4),
                ),
                const Divider(height: 32),
              ],
            ),
          ),
          DetailPaymentView(status: OrderStatus.done),
        ],
      ),
    );
  }

  Widget paymentRow(String label, String value, {String? struck}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          if (struck != null)
            Text(
              struck,
              style: const TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          if (struck != null) const SizedBox(width: 6),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
