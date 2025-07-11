import 'package:app/component/banner_card.dart';
import 'package:app/component/custom_border_button.dart';
import 'package:app/component/menu_view.dart';
import 'package:app/component/point_badge.dart';
import 'package:app/component/product_card.dart';
import 'package:app/component/promo_discount_card.dart';
import 'package:app/component/user_greeting.dart';
import 'package:app/feature/banner/view/banner_detail_page.dart';
import 'package:app/feature/cart/view/cart_page.dart';
import 'package:app/feature/home/view/header_menu.dart';
import 'package:app/feature/notification/view/notification_page.dart';
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

  final List<String> options = ['Semua', 'Terbaru', 'Terlaris', 'Terakhir Dilihat'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeaderMenu(
          onNotificationTap: () => nextPage(context, NotificationPage()),
          onCartTap: () => nextPage(context, CartPage()),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserGreeting(
              userName: 'Kate',
              imageUrl: 'https://i.pravatar.cc/150?img=5',
            ),
            PointBadge(point: 2000),
          ],
        ),
        SizedBox(height: 20),
        PromoBanner(
          image: 'promo_banner.png',
          currentIndex: 1,
          totalBanner: 4,
          onClick: (){
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
          children: [
            ProductCard(
              imageUrl: 'img_5.png',
              title: 'GR-BK-0081 Sprinkles sprinkle sprinkel 30..',
              price: 'Rp7.500',
              originalPrice: 'Rp15.000',
              rating: '5.0',
              sold: '100',
              discountLabel: '-50%',
              store: 'Yamama Bandung',
            ),
            ProductCard(
              imageUrl: 'img_6.png',
              title: 'GR-BK-0081 Sprinkles',
              price: 'Rp7.500',
              originalPrice: 'Rp15.000',
              rating: '5.0',
              sold: '999+',
              discountLabel: '-50%',
              store: 'Yamama Surabaya',
            ),
            ProductCard(
              imageUrl: 'img_8.png',
              title: 'GR-BK-0081 Sprinkles',
              price: 'Rp7.500',
              originalPrice: '',
              rating: '5.0',
              sold: '999+',
              discountLabel: '-50%',
              store: 'Yamama Surabaya',
            ),
            ProductCard(
              imageUrl: 'img_7.png',
              title: 'GR-BK-0081 Sprinkles',
              price: 'Rp7.500',
              originalPrice: '',
              rating: '',
              sold: '',
              discountLabel: '-50%',
              store: 'Yamama Tangerang',
            ),
          ],
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
