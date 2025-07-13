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
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "$dueTime, $dueDate",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Divider(height: 32),
            Text("Total Pembayaran", style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 4),
            Text(
              totalAmount,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Metode Pembayaran",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
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
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  vaNumber,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    // copy to clipboard logic
                  },
                  child: Text(
                    "Salin",
                    style: TextStyle(color: Colors.amber[800]),
                  ),
                ),
              ],
            ),
            Divider(height: 32),
            GestureDetector(
              onTap: () {
                // open payment instruction
              },
              child: Text(
                "Lihat Cara Pembayaran",
                style: TextStyle(
                  color: Colors.amber[800],
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
