import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class LoyaltyPage extends StatefulWidget {
  @override
  _LoyaltyPageState createState() => _LoyaltyPageState();
}

class _LoyaltyPageState extends State<LoyaltyPage> {
  String selectedFilter = 'Semua';

  final List<Map<String, String>> history = [
    {
      'type': 'Poin Didapat',
      'invoice': 'INV12349898989',
      'point': '+2.000',
      'date': '12 Juni 2025',
    },
    {
      'type': 'Poin Ditukar',
      'invoice': 'INV12349898989',
      'point': '+2.000',
      'date': '12 Juni 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filtered =
        selectedFilter == 'Semua'
            ? history
            : history.where((e) => e['type'] == selectedFilter).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: appText('Poin')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF1EEE8),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage('asset/images/loyalty_card.png'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'KATE INGRISA',
                    style: TextStyle(
                      letterSpacing: 10,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Image.asset('asset/icons/ic_point.png', width: 28),
                      // ganti dengan ikon koin
                      const SizedBox(width: 8),
                      const Text(
                        '2.000',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text('Poin'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '1.000 poin kadaluarsa pada 12 Desember 2025',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    ['Semua', 'Poin Didapat', 'Poin Ditukar'].map((label) {
                      bool isActive = selectedFilter == label;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              selectedFilter = label;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor:
                                isActive ? Color(0xFFF2DFB3) : Colors.white,
                            side: BorderSide(
                              color:
                                  isActive
                                      ? Color(0xFFD6A82F)
                                      : Colors.grey.shade300,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            label,
                            style: TextStyle(
                              fontSize: 13,
                              color:
                                  isActive ? Color(0xFFD6A82F) : Colors.black87,
                              fontWeight:
                                  isActive
                                      ? FontWeight.w400
                                      : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final item = filtered[index];
                  bool isEarned = item['type'] == 'Poin Didapat';
                  return menuList(item, isEarned);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuList(Map<String, String> item, bool isEarned) => Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isEarned ? Colors.green[100] : Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                item['type']!,
                style: TextStyle(color: Colors.black87, fontSize: 12),
              ),
            ),
            const Spacer(),
            Text(
              item['invoice']!,
              style: const TextStyle(
                color: Color(0xFFD4A437),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        dividerLine(padding: 0),
        const SizedBox(height: 12),
        Row(
          children: [
            Image.asset('asset/icons/ic_point.png', width: 20),
            const SizedBox(width: 6),
            Text(
              item['point']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Spacer(),
            Text(
              item['date']!,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ],
    ),
  );
}
