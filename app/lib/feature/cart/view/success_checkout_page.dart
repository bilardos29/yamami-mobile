import 'package:app/component/bottom_dialog.dart';
import 'package:app/component/custom_text_button.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/home/view/home_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckoutSuccessPage extends StatelessWidget {
  final bool isVA;

  const CheckoutSuccessPage({this.isVA = false, super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = const Color(0xFFC29620);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Image.asset('asset/images/ic_success.png', height: 160),
              const SizedBox(height: 24),
              const Text(
                "Order Berhasil Dibuat",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 4),
              const Text(
                "Terima kasih",
                style: TextStyle(color: Color(0xff8C867D)),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Segera lakukan pembayaran sebelum",
                      style: TextStyle(
                        color: Color(0xff8C867D),
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "24:00 WIB, 15 Agustus 2024",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Divider(height: 24),
                    const Text(
                      "Metode Pembayaran",
                      style: TextStyle(color: Color(0xff8C867D)),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Image.asset('asset/images/ic_bca.png', height: 24),
                        // logo BCA
                        const SizedBox(width: 8),
                        const Text(
                          "BCA Bank Transfer",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Rekening Atas Nama",
                      style: TextStyle(color: Color(0xff8C867D), fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Yamama",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Nomor Rekening",
                      style: TextStyle(color: Color(0xff8C867D), fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "9999 9999",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                              const ClipboardData(text: "99999999"),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Disalin ke clipboard"),
                              ),
                            );
                          },
                          child: Text(
                            "Salin",
                            style: TextStyle(color: themeColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Total Pembayaran",
                      style: TextStyle(color: Color(0xff8C867D), fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rp 13.123",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                              const ClipboardData(text: "13123"),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Disalin ke clipboard"),
                              ),
                            );
                          },
                          child: Text(
                            "Salin",
                            style: TextStyle(color: themeColor),
                          ),
                        ),
                      ],
                    ),
                    if (!isVA) ...[
                      const SizedBox(height: 12),
                      const Text(
                        "Pastikan pembayaran sesuai jangan lebih ataupun kurang sampai 3 digit terakhir",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    CustomTextButton(
                      text: 'Lihat Cara Pembayaran',
                      onClick: () {
                        showPaymentInstructionSheet(context);
                      },
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomTextButton(text: 'Lihat Detail Order', onClick: () {}),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: MainButton(
                  text: 'Kembali ke Home',
                  onPressed: () {
                    backToMainPage(context, HomePage());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
