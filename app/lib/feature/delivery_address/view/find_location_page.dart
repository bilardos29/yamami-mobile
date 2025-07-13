import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class FindLocationPage extends StatefulWidget {
  const FindLocationPage({super.key});

  @override
  State<FindLocationPage> createState() => _FindLocationPageState();
}

class _FindLocationPageState extends State<FindLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => popPage(context),
                    child: Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      alignment: Alignment.center,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Cari Kota, Kecamatan, atau Kode Pos',
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // "Gunakan lokasi saat ini" section
            ListTile(
              leading: Icon(Icons.my_location_outlined, color: Colors.black54),
              title: Text(
                'Gunakan lokasi saat ini',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {},
            ),
            const Divider(height: 1),

            // Provinsi section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Provinsi',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),

            ListTile(
              title: const Text('Jawa Barat'),
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            const Divider(height: 1),
            ListTile(
              title: const Text('Jawa Timur'),
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ],
        ),
      ),
    );
  }
}
