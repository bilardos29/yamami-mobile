import 'package:app/component/banner_card.dart';
import 'package:app/component/custom_border_button.dart';
import 'package:app/component/menu_view.dart';
import 'package:app/component/point_badge.dart';
import 'package:app/component/product_card.dart';
import 'package:app/component/promo_discount_card.dart';
import 'package:app/component/user_greeting.dart';
import 'package:app/feature/banner/view/banner_detail_page.dart';
import 'package:app/feature/cart/view/cart_page.dart';
import 'package:app/feature/home/model/product_model.dart';
import 'package:app/feature/home/view/header_menu.dart';
import 'package:app/feature/loyalty/view/loyalty_page.dart';
import 'package:app/feature/notification/view/notification_page.dart';
import 'package:app/feature/product/view/detail_product_page.dart';
import 'package:app/feature/search/view/search_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  final List<String> options = [
    'Semua',
    'Terbaru',
    'Terlaris',
    'Terakhir Dilihat',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderMenu(
                isDashboard: true,
                onNotificationTap: () => nextPage(context, NotificationPage()),
                onCartTap: () => nextPage(context, CartPage()),
                onSearch: () => nextPage(context, SearchPage()),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserGreeting(
                    userName: 'Kate',
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                  ),
                  PointBadge(
                    point: 2000,
                    onClick: () {
                      nextPage(context, LoyaltyPage());
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              PromoBanner(
                image: 'promo_banner.png',
                currentIndex: 1,
                totalBanner: 4,
                onClick: () {
                  nextPage(context, BannerDetailPage());
                },
              ),
              SizedBox(height: 20),
              MenuView(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PromoDiscountCard(
                    title: 'Mei Diskon',
                    discountLabel: '50%',
                    products: [
                      Product(
                        imageUrl: 'img_1.png',
                        originalPrice: 'Ro. 100.000',
                        discountedPrice: 'Ro. 50.000',
                      ),
                      Product(
                        imageUrl: 'img_2.png',
                        originalPrice: 'Ro. 100.000',
                        discountedPrice: 'Ro. 50.000',
                      ),
                    ],
                  ),
                  PromoDiscountCard(
                    bgColor: Colors.white,
                    title: 'Alat Kue',
                    discountLabel: '50%',
                    products: [
                      Product(
                        imageUrl: 'img_3.png',
                        originalPrice: 'Ro. 100.000',
                        discountedPrice: 'Ro. 70.000',
                      ),
                      Product(
                        imageUrl: 'img_4.png',
                        originalPrice: 'Ro. 100.000',
                        discountedPrice: 'Ro. 70.000',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(options.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CustomBorderButton(
                        label: options[index],
                        isSelected: selectedIndex == index,
                        onPressed: () {
                          setState(() => selectedIndex = index);
                        },
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children:
                    products.map((product) {
                      return ProductCard(
                        product: product,
                        onClick: () => nextPage(context, DetailProductPage()),
                      );
                    }).toList(),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }
}
