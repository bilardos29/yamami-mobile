import 'package:app/component/main_button.dart';
import 'package:app/feature/transaction/view/detail_transaction_page.dart';
import 'package:app/feature/transaction/view/review_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class DetailPaymentView extends StatelessWidget {
  final OrderStatus status;

  const DetailPaymentView({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = TextStyle(color: Colors.brown[800]);
    TextStyle valueStyle = TextStyle(color: Colors.brown[800]);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Detail Pembayaran",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.brown[900],
              )),
          SizedBox(height: 16),
          buildRow("Metode Pembayaran", "BCA Virtual Account"),
          SizedBox(height: 12),
          buildRow("Subtotal", "Rp 15.000"),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Biaya pengiriman", style: labelStyle),
              Row(
                children: [
                  Text(
                    "Rp 10.000",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text("Rp 0", style: valueStyle),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          buildRow("Biaya Layanan", "Rp 0"),
          SizedBox(height: 12),
          buildRow("Diskon", "- Rp 0"),
          SizedBox(height: 12),
          buildRow("Potongan Poin", "- Rp 2.000"),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total pembayaran",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.brown[900],
                  )),
              Text(
                "Rp 13.000",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          _buildDynamicAction(context),
        ],
      ),
    );
  }

  Widget buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.brown[800])),
        Text(value, style: TextStyle(color: Colors.brown[800])),
      ],
    );
  }

  Widget _buildDynamicAction(BuildContext ctx) {
    switch (status) {
      case OrderStatus.waitingPayment:
      case OrderStatus.done:
      case OrderStatus.processed:
        return const SizedBox();
      case OrderStatus.shipped:
        return MainButton(text: 'Selesaikan Pesanan', onPressed: (){});
      case OrderStatus.completed:
        return MainButton(text: 'Beri Ulasan', onPressed: (){
          nextPage(ctx, ReviewPage());
        });
      case OrderStatus.reviewed:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("⭐⭐⭐⭐⭐"),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () {}, child: const Text("Beli Lagi")),
          ],
        );
      case OrderStatus.canceled:
        return MainButton(text: 'Beli Lagi', onPressed: (){

        });
    }
  }
}
