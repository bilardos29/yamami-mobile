import 'package:app/component/custom_image_network.dart';
import 'package:app/feature/banner/controller/banner_controller.dart';
import 'package:app/feature/home/model/banner_model.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BannerDetailPage extends StatelessWidget {
  final String bannerId;

  const BannerDetailPage({required this.bannerId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Banner"),
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer<BannerController>(
          builder: (context, ctrl, ch) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Container(
                  height: 200,
                  margin: EdgeInsets.only(bottom: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CustomImageNetwork(ctrl.item.image ?? ''),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  ctrl.item.name ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Berlaku sampai ${convertDate(ctrl.item.endDate ?? '')}",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                Text('${ctrl.item.description}', style: TextStyle(height: 1.5)),
                const SizedBox(height: 16),
                const Divider(),
                const Text("Kode Promo", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          ctrl.item.voucherCode ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: ctrl.item.voucherCode ?? ''),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Kode promo berhasil disalin!"),
                          ),
                        );
                      },
                      child: const Text(
                        "Copy",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const Text(
                  "Syarat dan Ketentuan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(ctrl.item.tnc ?? ''),
                const SizedBox(height: 24),
              ],
            );
          },
        ),
      ),
    );
  }
}
