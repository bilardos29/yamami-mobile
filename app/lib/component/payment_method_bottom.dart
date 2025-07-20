import 'package:flutter/material.dart';

Future<void> showPaymentMethodBottomSheet({
  required BuildContext context,
  required String? selectedBank,
  required Function(String) onSelected,
}) async {
  final banks = [
    {'name': 'Bank Transfer BCA', 'value': 'bca', 'logo': 'payment1.png'},
    {
      'name': 'Bank Transfer Mandiri',
      'value': 'mandiri',
      'logo': 'payment2.png',
    },
    {'name': 'Bank Transfer BNI', 'value': 'bni', 'logo': 'payment3.png'},
  ];

  await showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pilih Metode Pembayaran",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Bank Transfer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ...banks.map((bank) {
              final isSelected = selectedBank == bank['name'];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(
                  'asset/images/${bank['logo']!}',
                  height: 32,
                  width: 32,
                ),
                title: Text(bank['name']!, style: TextStyle(fontSize: 14)),
                trailing:
                    isSelected
                        ? const Icon(Icons.check_circle, color: Color(0xffB4870F))
                        : null,
                onTap: () {
                  onSelected(bank['name']!);
                  Navigator.pop(context);
                },
              );
            }).toList(),
            const SizedBox(height: 12),
          ],
        ),
      );
    },
  );
}
