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

class OrderDetailPage extends StatefulWidget {
  final OrderStatus status;

  const OrderDetailPage({required this.status, super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  List<OrderStep> listStep = [
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
      status: OrderStepStatus.pending,
    ),
  ];
  List<OrderStep> listFilterStep = [];

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
          if (widget.status != OrderStatus.waitingPayment) ...[
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
          ProductView(status: widget.status),
          const SizedBox(height: 12),
          DetailPaymentView(status: widget.status),
          if (widget.status == OrderStatus.waitingPayment) ...[
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
        }[widget.status]!;

    final color =
        {
          OrderStatus.waitingPayment: Colors.orange,
          OrderStatus.processed: Colors.blue,
          OrderStatus.shipped: Colors.lightBlue,
          OrderStatus.completed: Colors.green,
          OrderStatus.reviewed: Colors.green,
          OrderStatus.canceled: Colors.grey,
        }[widget.status]!;

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
              if (!(widget.status == OrderStatus.waitingPayment ||
                  widget.status == OrderStatus.canceled))
                CustomTextButton(
                  text: 'Lihat Detail',
                  onClick: () {
                    if (widget.status == OrderStatus.processed) {
                      listFilterStep = [];
                      listFilterStep = List.from(listStep);
                    }
                    if (widget.status == OrderStatus.shipped) {
                      listFilterStep = [];
                      listFilterStep.add(
                        OrderStep(
                          title: 'Dalam Pengiriman',
                          date: '15 Agustus 2024',
                          subtitle: 'Pesanan dalam pengiriman',
                          mapUrl: 'sample_map.png',
                          courierName: 'Gege Yu',
                          courierInfo: 'D 7678 XYZ',
                          courierImage: 'img_usr_1.png',
                          status: OrderStepStatus.completed,
                        ),
                      );
                      listStep[1].status = OrderStepStatus.pending;
                      listStep[0].status = OrderStepStatus.pending;
                      listFilterStep.addAll(List.from(listStep));
                    } else if (widget.status == OrderStatus.completed) {
                      listFilterStep = [];
                      listFilterStep.add(
                        OrderStep(
                          title: 'Selesai',
                          date: '19 Agustus 2024',
                          subtitle: 'Pesanan telah selesai',
                          status: OrderStepStatus.completed,
                        ),
                      );
                      listFilterStep.add(
                        OrderStep(
                          title: 'Dalam Pengiriman',
                          date: '15 Agustus 2024',
                          subtitle: 'Pesanan dalam pengiriman',
                          mapUrl: 'sample_map.png',
                          courierName: 'Gege Yu',
                          courierInfo: 'D 7678 XYZ',
                          courierImage: 'img_usr_1.png',
                          status: OrderStepStatus.pending,
                        ),
                      );
                      listStep[1].status = OrderStepStatus.pending;
                      listStep[0].status = OrderStepStatus.pending;
                      listFilterStep.addAll(List.from(listStep));
                    }
                    bottomModel(ctx);
                  },
                ),
            ],
          ),
          const SizedBox(height: 16),
          if (widget.status != OrderStatus.waitingPayment) ...[
            _buildOrderInfo(),
            const SizedBox(height: 16),
          ],
          if (widget.status == OrderStatus.waitingPayment) ...[
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
      return BottomDialog(status: 'Selesai', steps: listFilterStep);
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
            if (widget.status != OrderStatus.canceled) ...[
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
