import 'package:app/component/custom_text_button.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/cart/model/cart_model.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      store: 'Toko Bandung',
      storeImage: 'img_usr_1.png',
      name: 'GR-BK-0081 Sprinkles sprinkle...',
      variant: 'Kuning | Size 2',
      price: 7500,
      originalPrice: 15000,
      image: 'img_5.png',
      selected: true,
    ),
    CartItem(
      store: 'Toko Bandung',
      storeImage: 'img_usr_1.png',
      name: 'GR-BK-0081 Sprinkles sprinkle...',
      variant: 'Hitam',
      price: 7500,
      image: 'img_6.png',
    ),
    CartItem(
      store: 'Toko Jawa',
      storeImage: 'img_usr_1.png',
      name: 'GR-BK-0081 Sprinkles sprinkle...',
      variant: 'Kuning | Size 2',
      price: 7500,
      originalPrice: 15000,
      image: 'img_7.png',
      selected: true,
    ),
  ];

  bool get allSelected => cartItems.every((item) => item.selected);

  double get subtotal => cartItems
      .where((item) => item.selected)
      .fold(0, (sum, item) => sum + item.price * item.quantity);

  void toggleSelectAll(bool? value) {
    setState(() {
      for (var item in cartItems) {
        item.selected = value ?? false;
      }
    });
  }

  void removeSelected() {
    setState(() {
      cartItems.removeWhere((item) => item.selected);
    });
  }

  void updateQuantity(int index, int delta) {
    setState(() {
      cartItems[index].quantity = (cartItems[index].quantity + delta).clamp(
        1,
        99,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<CartItem>> groupedItems = {};
    for (var item in cartItems) {
      groupedItems.putIfAbsent(item.store, () => []).add(item);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: appText('Keranjang')),
      bottomNavigationBar: Container(
        height: 78,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sub total',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Rp ${subtotal.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 140,
                child: MainButton(text: 'Bayar', onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Checkbox(
                  visualDensity: VisualDensity.compact,
                  value: allSelected,
                  onChanged: toggleSelectAll,
                ),
                SizedBox(width: 4),
                const Text('Pilih Semua'),
                const Spacer(),
                CustomTextButton(text: 'Hapus', onClick: removeSelected),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children:
                  groupedItems.entries.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              visualDensity: VisualDensity.compact,
                              value: false,
                              onChanged: (val) {},
                            ),
                            SizedBox(width: 4),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'asset/images/img_usr_1.png',
                                width: 24,
                                height: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              entry.key,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ...entry.value.map((item) {
                          int index = cartItems.indexOf(item);
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                  visualDensity: VisualDensity.compact,
                                  value: item.selected,
                                  onChanged: (val) {
                                    setState(() {
                                      item.selected = val ?? false;
                                    });
                                  },
                                ),
                                SizedBox(width: 4),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(
                                    'asset/images/${item.image}',
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        item.variant,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            'Rp ${item.price.toStringAsFixed(0)}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          if (item.originalPrice != null)
                                            Text(
                                              'Rp ${item.originalPrice!.toStringAsFixed(0)}',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        visualDensity: VisualDensity.compact,
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 12,
                                        ),
                                        onPressed:
                                            () => updateQuantity(index, -1),
                                      ),
                                      Text(
                                        item.quantity.toString(),
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        visualDensity: VisualDensity.compact,
                                        icon: const Icon(Icons.add, size: 12),
                                        onPressed:
                                            () => updateQuantity(index, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
