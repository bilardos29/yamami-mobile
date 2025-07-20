import 'package:flutter/material.dart';

class ShippingAddressSection extends StatefulWidget {
  const ShippingAddressSection({super.key});

  @override
  State<ShippingAddressSection> createState() => _ShippingAddressSectionState();
}

class _ShippingAddressSectionState extends State<ShippingAddressSection> {
  bool isDropshipper = false;
  final TextEditingController senderNameController = TextEditingController();
  final TextEditingController senderPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Alamat Pengiriman",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff271B09),
                fontSize: 12,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Ubah",
                style: TextStyle(
                  color: Color(0xFFB4870F),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "Raska Amelia - 087878793893",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff271B09),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Rumah - Jalan Supratman No 31, RT 23 RW 23, Kel.Cibeunying, Kec Cimenyan, Bandung,  Jawa barat",
          style: TextStyle(color: Color(0xff8C867D), fontSize: 12),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: isDropshipper,
              activeColor: const Color(0xFFB4870F),
              visualDensity: VisualDensity.compact,
              onChanged: (value) {
                setState(() {
                  isDropshipper = value ?? false;
                });
              },
            ),
            const Text(
              "Kirim sebagai dropshipper",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ],
        ),
        if (isDropshipper) ...[
          const SizedBox(height: 12),
          TextFormField(
            controller: senderNameController,
            decoration: InputDecoration(
              hintText: "Nama pengirim",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: senderPhoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Nomor telepon pengirim",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
