import 'package:app/component/custom_text_button.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/transaction/view/widgets/address_view.dart';
import 'package:app/feature/transaction/view/widgets/bottom_dialog.dart';
import 'package:app/feature/transaction/view/widgets/detail_payment_view.dart';
import 'package:app/feature/transaction/view/widgets/product_view.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

import 'widgets/payment_view.dart';

enum OrderStatus {
  waitingPayment,
  processed,
  shipped,
  completed,
  reviewed,
  canceled,
  done,
}

class OrderDetailPage extends StatelessWidget {
  final OrderStatus status;

  const OrderDetailPage({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Detail Pesanan'),
        actions: [
          CustomTextButton(text: 'Bantuan', onClick: () {}),
          const SizedBox(width: 16),
        ],
      ),
      backgroundColor: Color(0xfff1f1f1),
      body: ListView(
        children: [
          _buildStatusSection(context),
          const SizedBox(height: 12),
          if (status != OrderStatus.waitingPayment) ...[
            AddressView(
              namaPenerima: "Raska Amelia",
              nomorHp: "087878793893",
              alamatLengkap:
                  "Rumah - Jalan Supratman No 31, RT 23 RW 23,\nKel.Cibeunying, Kec Cimenyan, Bandung, Jawa barat",
              namaDropshipper: "Raska Amelia",
              nomorDropshipper: "087878793893",
            ),
            const SizedBox(height: 12),
          ],
          ProductView(status: status),
          const SizedBox(height: 12),
          DetailPaymentView(status: status),
          if (status == OrderStatus.waitingPayment) ...[
            const SizedBox(height: 12),
            AddressView(
              namaPenerima: "Raska Amelia",
              nomorHp: "087878793893",
              alamatLengkap:
                  "Rumah - Jalan Supratman No 31, RT 23 RW 23,\nKel.Cibeunying, Kec Cimenyan, Bandung, Jawa barat",
              namaDropshipper: "Raska Amelia",
              nomorDropshipper: "087878793893",
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusSection(BuildContext ctx) {
    final statusText =
        {
          OrderStatus.waitingPayment: 'Menunggu Pembayaran',
          OrderStatus.processed: 'Diproses',
          OrderStatus.shipped: 'Dalam Pengiriman',
          OrderStatus.completed: 'Selesai',
          OrderStatus.reviewed: 'Selesai',
          OrderStatus.canceled: 'Dibatalkan',
        }[status]!;

    final color =
        {
          OrderStatus.waitingPayment: Colors.orange,
          OrderStatus.processed: Colors.blue,
          OrderStatus.shipped: Colors.lightBlue,
          OrderStatus.completed: Colors.green,
          OrderStatus.reviewed: Colors.green,
          OrderStatus.canceled: Colors.grey,
        }[status]!;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              if (!(status == OrderStatus.waitingPayment ||
                  status == OrderStatus.canceled))
                CustomTextButton(text: 'Lihat Detail', onClick: () {
                  bottomModel(ctx);
                }),
            ],
          ),
          const SizedBox(height: 16),
          if (status != OrderStatus.waitingPayment) ...[
            _buildOrderInfo(),
            const SizedBox(height: 16),
          ],
          if (status == OrderStatus.waitingPayment) ...[
            PaymentView(),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  bottomModel(BuildContext context) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return BottomDialog(
        status: 'Selesai',
        steps: [
          OrderStep(
            title: 'Selesai',
            date: '19 Agustus 2024',
            subtitle: 'Pesanan telah selesai',
            status: OrderStepStatus.completed,
          ),
          OrderStep(
            title: 'Dalam Pengiriman',
            date: '15 Agustus 2024',
            subtitle: 'Pesanan dalam pengiriman',
            mapUrl: 'https://maps.googleapis.com/map.png',
            // placeholder
            courierName: 'Gege Yu',
            courierInfo: 'D 7678 XYZ',
            courierImage: 'https://randomuser.me/api/portraits/men/1.jpg',
            status: OrderStepStatus.completed,
          ),
          OrderStep(
            title: 'Diproses',
            date: '15 Agustus 2024',
            subtitle: 'Pesanan telah diproses oleh Jahitmart',
            status: OrderStepStatus.completed,
          ),
          OrderStep(
            title: 'Menunggu Pembayaran',
            date: '15 Agustus 2024',
            subtitle: 'Pembayaran telah dilakukan',
            status: OrderStepStatus.completed,
          ),
        ],
      );
    },
  );

  Widget _buildOrderInfo() {
    return Column(
      children: [
        dividerLine(padding: 0),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (status != OrderStatus.canceled) ...[
              Text(
                "INV12349898989",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 4),
              CustomTextButton(text: 'Kirim', onClick: () {}),
              const Spacer(),
            ],
            Text("15 Agustus 2024"),
          ],
        ),
      ],
    );
  }
}
