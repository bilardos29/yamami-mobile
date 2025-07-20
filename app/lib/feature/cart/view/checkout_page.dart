import 'package:app/component/bottom_dialog.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/cart/view/success_checkout_page.dart';
import 'package:app/feature/cart/view/widget/shipping_address_view.dart';
import 'package:app/feature/transaction/view/detail_transaction_page.dart';
import 'package:app/feature/transaction/view/widgets/detail_payment_view.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool agreeTerms = false;
  bool usePoints = true;

  String methodPayment = '';

  List<Map<String, String>> listData = [
    {
      'storeName': "Toko Bandung",
      'imageStore': "img_usr_1.png",
      'imageProduct': "img_5.png",
      'title': "GR-BK-0081 Sprinkles sprinkle...",
      'note': "Tolong dipacking dengan baik",
      'price': '7500',
    },
    {
      'storeName': "Toko Jawa",
      'imageStore': "img_usr_1.png",
      'imageProduct': "img_6.png",
      'title': "GR-BK-0081 Sprinkles sprinkle",
      'price': '7500',
      'note': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Checkout')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ShippingAddressSection(),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Alamat Pengiriman',
              //       style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              //     ),
              //     SizedBox(height: 6),
              //     MainButton(text: 'Atur alamat pengiriman', onPressed: () {}),
              //   ],
              // ),
            ),
            Divider(
              height: 5,
              thickness: 5,
              color: Colors.grey.withOpacity(0.2),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listData.length,
              itemBuilder: (ctx, idx) {
                return buildStoreSection(
                  storeName: listData[idx]['storeName']!,
                  imageStore: listData[idx]['imageProduct']!,
                  imageProduct: listData[idx]['imageProduct']!,
                  title: listData[idx]['title']!,
                  note: listData[idx]['note']!,
                  price: int.parse(listData[idx]['price']!),
                  onChanged: (val) {
                    setState(() {
                      listData[idx]['note'] = val;
                    });
                  },
                );
              },
            ),
            Divider(
              height: 3,
              thickness: 5,
              color: Colors.grey.withOpacity(0.2),
            ),
            // Promo
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Promo"),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      showPromoBottomSheet(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 0.8, color: Colors.black12),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'asset/icons/ic_promo.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 12),
                          Text("Cek promo kamu disini"),
                          Spacer(),
                          Image.asset(
                            'asset/icons/ic_arrow_bottom.png',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  dividerLine(padding: 0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 0.8,
                        color:
                            usePoints
                                ? Theme.of(context).primaryColor
                                : Colors.black12,
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'asset/icons/ic_point.png',
                          width: 28,
                          height: 28,
                        ),
                        SizedBox(width: 12),
                        Text("Gunakan 2.000 Poin"),
                        Spacer(),
                        Checkbox(
                          visualDensity: VisualDensity.compact,
                          value: usePoints,
                          onChanged: (val) {
                            setState(() {
                              usePoints = val ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 3,
              thickness: 5,
              color: Colors.grey.withOpacity(0.2),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih Metode Pembayaran',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      showPaymentMethod(
                        context,
                        methodPayment,
                        onSelect: (val) {
                          setState(() {
                            methodPayment = val;
                          });
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'asset/icons/ic_payment.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            methodPayment.isEmpty
                                ? 'Pilih Metode Pembayaran'
                                : methodPayment,
                          ),
                          const Spacer(),
                          Image.asset(
                            'asset/icons/ic_arrow_bottom.png',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 3,
              thickness: 5,
              color: Colors.grey.withOpacity(0.2),
            ),
            DetailPaymentView(
              status: OrderStatus.waitingPayment,
              metodePembayaran: '',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Checkbox(
                    visualDensity: VisualDensity.compact,
                    value: agreeTerms,
                    onChanged: (val) {
                      setState(() {
                        agreeTerms = val ?? false;
                      });
                    },
                  ),
                  SizedBox(width: 2),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 14),
                      children: [
                        TextSpan(text: "Saya telah membaca "),
                        TextSpan(
                          text: "Syarat dan Ketentuan",
                          style: TextStyle(color: Color(0xffB4870F)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: MainButton(
                text: 'Bayar',
                isActive: agreeTerms,
                onPressed: () {
                  if (agreeTerms)
                    backToMainPage(context, CheckoutSuccessPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStoreSection({
    required String storeName,
    required String imageStore,
    required String imageProduct,
    required String title,
    required int price,
    String? note,
    ValueChanged<String>? onChanged,
  }) {
    String? selectedShipping;
    String noteVal = note!;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'asset/images/$imageStore',
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Text(
                storeName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'asset/images/$imageProduct',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "Kuning | Size 2",
                      style: TextStyle(fontSize: 12, color: Color(0xff8C867D)),
                    ),
                    Text(
                      "Rp $price x 1",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  noteVal,
                  style: TextStyle(fontSize: 12, color: Color(0xff271B09)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showNoteBottomSheet(context, noteVal, onChanged: onChanged);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      note.isNotEmpty ? 'Ubah' : 'Tambah Catatan',
                      style: TextStyle(fontSize: 12, color: Color(0xFFB4870F)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedShipping,
            decoration: const InputDecoration(
              hintText: "Pilih jasa pengiriman",
              border: OutlineInputBorder(),
            ),
            selectedItemBuilder: (context) {
              return ['instant', 'jne', 'jnt'].map((value) {
                final label = _getShippingLabel(value);
                final price = _getShippingPrice(value);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(label), Text(price)],
                );
              }).toList();
            },
            items: const [
              DropdownMenuItem(
                value: "instant",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Instant (2 jam sampai)",
                      style: TextStyle(fontSize: 14),
                    ),
                    const Spacer(),
                    Text("Rp 30.000", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: "jne",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("JNE (3-4 Hari)", style: TextStyle(fontSize: 14)),
                    const Spacer(),
                    Text("Rp 10.000", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: "jnt",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("JNT (3-4 Hari)", style: TextStyle(fontSize: 14)),
                    const Spacer(),
                    Text("Rp 10.000", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
            onChanged: (val) {
              setState(() {
                selectedShipping = val;
              });
            },
          ),
        ],
      ),
    );
  }

  String _getShippingLabel(String value) {
    switch (value) {
      case 'instant':
        return 'Instant (2 jam sampai)     ';
      case 'jne':
        return 'JNE (3-4 Hari)     ';
      case 'jnt':
        return 'JNT (3-4 Hari)     ';
      default:
        return '';
    }
  }

  String _getShippingPrice(String value) {
    switch (value) {
      case 'instant':
        return 'Rp 30.000';
      case 'jne':
      case 'jnt':
        return 'Rp 10.000';
      default:
        return '';
    }
  }
}
