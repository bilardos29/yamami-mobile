import 'package:flutter/material.dart';

class LihatPembayaranBottomDialog extends StatefulWidget {
  const LihatPembayaranBottomDialog({super.key});

  @override
  State<LihatPembayaranBottomDialog> createState() =>
      _LihatPembayaranBottomDialogState();
}

class _LihatPembayaranBottomDialogState
    extends State<LihatPembayaranBottomDialog> {
  int expandedIndex = 0;

  final List<String> titles = [
    'ATM BCA',
    'm-BCA (BCA mobile)',
    'Internet Banking BCA',
  ];

  final List<List<String>> contents = [
    [
      'Masukkan Kartu ATM BCA & PIN',
      'Pilih menu Transaksi Lainnya > Transfer > ke Rekening BCA Virtual Account',
      'Di halaman konfirmasi, pastikan detil pembayaran sudah sesuai seperti No VA, Nama, Perus/Produk dan Total Tagihan',
      'Masukkan Jumlah Transfer sesuai dengan Total Tagihan',
      'Ikuti instruksi untuk menyelesaikan transaksi',
      'Simpan struk transaksi sebagai bukti pembayaran',
    ],
    [
      'Login ke m-BCA',
      'Pilih m-Transfer > BCA Virtual Account',
      'Masukkan No Virtual Account dan ikuti instruksi pembayaran',
    ],
    [
      'Login ke Internet Banking',
      'Pilih menu Transfer Dana > ke Rekening BCA Virtual Account',
      'Masukkan detail pembayaran dan ikuti instruksi hingga selesai',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Cara Pembayaran',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(height: 1, thickness: 0.5, color: Colors.grey),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    final isExpanded = expandedIndex == index;
                    return Column(
                      children: [
                        ExpansionTile(
                          title: Text(
                            titles[index],
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          initiallyExpanded: isExpanded,
                          trailing: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          ),
                          onExpansionChanged: (expanded) {
                            setState(() {
                              expandedIndex = expanded ? index : -1;
                            });
                          },
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    contents[index]
                                        .map(
                                          (item) => Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  '• ',
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 1, thickness: 0.5, color: Colors.grey)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
