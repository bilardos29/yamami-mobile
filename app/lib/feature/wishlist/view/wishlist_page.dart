import 'package:app/component/product_card.dart';
import 'package:app/component/search_view.dart';
import 'package:app/feature/cart/view/cart_page.dart';
import 'package:app/feature/home/model/product_model.dart';
import 'package:app/feature/home/view/header_menu.dart';
import 'package:app/feature/notification/view/notification_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: HeaderMenu(
            title: 'Wishlist',
            onNotificationTap: () => nextPage(context, NotificationPage()),
            onCartTap: () => nextPage(context, CartPage()),
          ),
        ),
        Container(
          height: 2,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        listState,
        // emptyState(title: 'Produk di Wishlist', detail: 'produk wishlist', (){
        //   nextPage(context, Container());
        // })
      ],
    );
  }

  Widget get listState => Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 8),
          SearchView(controller: controller, hint: 'Cari Produk', onFocus: (){}),
          SizedBox(height: 12),
          StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: products.map((product) {
              return ProductCard(product: product);
            }).toList(),
          ),
        ],
      ),
    ),
  );
}
