import 'package:app/component/main_button.dart';
import 'package:flutter/material.dart';

class PromoBottom extends StatefulWidget {
  const PromoBottom({super.key});

  @override
  State<PromoBottom> createState() => _PromoBottomState();
}

class _PromoBottomState extends State<PromoBottom> {
  String? selectedPromo;

  final promos = [
    {
      'title': 'Diskon 50%',
      'date': 'Berlaku 15 - 17 Agu 2024',
      'desc': 'min. pembelian Rp 200.000 hanya berlaku untuk pengguna baru',
      'value': 'diskon50',
    },
    {
      'title': 'Diskon 25%',
      'date': 'Berlaku 15 - 17 Agu 2024',
      'desc': 'min. pembelian Rp 200.000 hanya berlaku untuk pengguna baru',
      'value': 'diskon25',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 24),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Promo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Kode promo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 140,
                child: MainButton(
                  text: 'Terapkan',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...promos.map((promo) {
            final isSelected = selectedPromo == promo['value'];
            return GestureDetector(
              onTap: () {
                setState(() => selectedPromo = promo['value'] as String);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFFFF9ED) : Colors.white,
                  border: Border.all(
                    color:
                        isSelected
                            ? const Color(0xFFC29620)
                            : Colors.grey[300]!,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            promo['title']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${promo['date']} - ${promo['desc']}',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      const Icon(Icons.check_circle, color: Color(0xFFC29620)),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
