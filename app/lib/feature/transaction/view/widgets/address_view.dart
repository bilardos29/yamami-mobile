import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  final String namaPenerima;
  final String nomorHp;
  final String alamatLengkap;
  final String namaDropshipper;
  final String nomorDropshipper;


  const AddressView({
    super.key,
    required this.namaPenerima,
    required this.nomorHp,
    required this.alamatLengkap,
    required this.namaDropshipper,
    required this.nomorDropshipper,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Alamat Pengiriman",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              )),
          SizedBox(height: 8),
          Text("$namaPenerima - $nomorHp",
              style: TextStyle(color: Colors.brown[800])),
          SizedBox(height: 4),
          Text(
            alamatLengkap,
            style: TextStyle(color: Colors.grey[700]),
          ),
          Divider(height: 28),
          Text("Dropshipper",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              )),
          SizedBox(height: 6),
          Text("$namaDropshipper - $nomorDropshipper",
              style: TextStyle(color: Colors.brown[800])),
        ],
      ),
    );
  }
}
