import 'package:app/component/custom_text_button.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  final String dueDate = "15 Agustus 2024";
  final String dueTime = "24:00 WIB";
  final String totalAmount = "Rp 13.000";
  final String bankName = "BCA Virtual Account";
  final String vaNumber = "87287 89898 89899";

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Segera lakukan pembayaran sebelum",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "$dueTime, $dueDate",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Divider(height: 40),
            Text(
              "Total Pembayaran",
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
            Text(
              totalAmount,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Metode Pembayaran",
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
            Row(
              children: [
                Image.asset("asset/images/ic_bca.png", width: 48),
                SizedBox(width: 8),
                Text(bankName, style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Nomor Virtual Account",
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
            Row(
              children: [
                Text(
                  vaNumber,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                CustomTextButton(text: 'Salin', onClick: () {}),
              ],
            ),
            Divider(height: 32),
            GestureDetector(
              onTap: () {
              },
              child: Text(
                "Lihat Cara Pembayaran",
                style: TextStyle(
                  color: Color(0xffB4870F),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
