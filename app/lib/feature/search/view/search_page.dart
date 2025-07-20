import 'package:app/component/bottom_dialog.dart';
import 'package:app/component/product_card.dart';
import 'package:app/feature/cart/view/cart_page.dart';
import 'package:app/feature/home/model/product_model.dart';
import 'package:app/feature/product/view/detail_product_page.dart';
import 'package:app/feature/product/view/filter_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController(
    text: "Alat kue",
  );
  final FocusNode _focusNode = FocusNode();
  bool isFocused = true;
  bool isEmpty = false;
  bool filtered = false;

  List<String> recentSearch = ['Alat kue'];
  List<String> suggestions = ['Alat Kue', 'Alat Pesta'];

  final List<Map<String, dynamic>> productList = [
    {
      "image": "img_5.png",
      "title": "GR-BK-0081 Sprinkles sprinkle 30...",
      "price": "Rp7.500",
      "oldPrice": "Rp15.000",
      "rating": "5.0",
      "location": "Yamama Bandung",
      "discount": true,
    },
    {
      "image": "img_6.png",
      "title": "GR-BK-0081 Sprinkles sprinkle 30...",
      "price": "Rp7.500",
      "oldPrice": "",
      "rating": "5.0",
      "location": "Yamama Tangerang",
      "discount": false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
      if (_focusNode.hasFocus) {
        debugPrint("TextField is focused");
      } else {
        debugPrint("TextField lost focus");
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchBar(),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body:
          isEmpty
              ? _buildEmptyResult()
              : isFocused
              ? _searchStack()
              : _buildSearchResults(),
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
                      hintText: "Cari produk...",
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

  Widget _buildSearchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Text('Menampilkan "200" Produk Alat Kue'),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children:
                productList.map((product) {
                  ProductModel item = ProductModel(
                    imageUrl: product["image"],
                    title: product["title"],
                    price: product["price"],
                    originalPrice: product["oldPrice"],
                    rating: product["rating"],
                    sold: '999+',
                    store: product["location"],
                    discountLabel: product["discount"] == true ? '-50%' : '',
                  );
                  return ProductCard(
                    product: item,
                    onClick: () => nextPage(context, DetailProductPage()),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyResult() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/images/img_empty_state.png', height: 150),
            const SizedBox(height: 24),
            const Text(
              "Barang Tidak Ditemukan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "Maaf, barang tidak ditemukan, coba kata kunci lain",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
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
