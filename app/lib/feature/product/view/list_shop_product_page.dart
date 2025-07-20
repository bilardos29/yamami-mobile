import 'package:app/component/bottom_dialog.dart';
import 'package:app/component/product_card.dart';
import 'package:app/feature/cart/view/cart_page.dart';
import 'package:app/feature/product/view/filter_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../home/model/product_model.dart';
import 'detail_product_page.dart';

class ListShopProductPage extends StatefulWidget {
  const ListShopProductPage({super.key});

  @override
  State<ListShopProductPage> createState() => _ListShopProductPageState();
}

class _ListShopProductPageState extends State<ListShopProductPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool isFocused = false;
  bool isEmpty = false;
  bool filtered = false;

  List<String> recentSearch = ['Alat kue'];
  List<String> suggestions = ['Alat Kue', 'Alat Pesta'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: _buildSearchBar(),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'asset/images/img_usr_1.png',
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Yamama Bandung',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Kota Bandung', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            dividerLine(padding: 8),
            if (isFocused)
              _searchStack()
            else ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Row(
                  children: [
                    Text('Menampilkan "100" Produk Alat Kue'),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showSortDialog(context);
                      },
                      child: Image.asset(
                        'asset/icons/ic_sort.png',
                        width: 38,
                        height: 38,
                      ),
                    ),
                    SizedBox(width: 4),
                    InkWell(
                      onTap: () {
                        nextPage(
                          context,
                          FilterPage(
                            onChanged: (val) {
                              setState(() {
                                filtered = val == 'ada' ? true : false;
                              });
                            },
                          ),
                        );
                      },
                      child: Image.asset(
                        'asset/icons/${filtered ? 'ic_filter_selected.png' : 'ic_filter.png'}',
                        width: 38,
                        height: 38,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.65,
                  children:
                      products.map((product) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductCard(
                            product: product,
                            maxlines: 1,
                            onClick:
                                () => nextPage(context, DetailProductPage()),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                if (!isFocused) ...[
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 6),
                ],
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    decoration: const InputDecoration(
                      hintText: "Cari produk di toko",
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                if (isFocused)
                  GestureDetector(
                    onTap: () => _searchController.clear(),
                    child: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (!isFocused) ...[
          SizedBox(width: 8),
          buildIconWithBadge(
            image: 'ic_cart.png',
            onTap: () => nextPage(context, CartPage()),
          ),
        ],
      ],
    );
  }

  Widget _searchStack() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const Divider(height: 0.8),
        if (recentSearch.isNotEmpty)
          ListTile(
            leading: const Icon(Icons.access_time, size: 20),
            title: InkWell(
              onTap: () {
                setState(() {
                  isFocused = false;
                  FocusScope.of(context).unfocus();
                });
              },
              child: Text(recentSearch[0]),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  recentSearch.removeAt(0);
                });
              },
            ),
          ),
        const Divider(height: 0.8),
        ...suggestions.map((text) {
          return Column(
            children: [
              ListTile(
                title: Text(text),
                onTap: () {
                  setState(() {
                    isFocused = false;
                    FocusScope.of(context).unfocus();
                  });
                },
              ),
              const Divider(height: 0.8),
            ],
          );
        }),
      ],
    );
  }
}
