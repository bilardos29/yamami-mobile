import 'package:app/feature/home/view/bottom_menu.dart';
import 'package:app/feature/home/view/dashboard_page.dart';
import 'package:app/feature/profile/view/profile_page.dart';
import 'package:app/feature/transaction/view/transaction_history_page.dart';
import 'package:app/feature/wishlist/view/wishlist_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _menu = 0;

  changedMenu(int menu) {
    setState(() {
      _menu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _menu == 0
                          ? DashboardPage()
                          : _menu == 1
                          ? WishlistPage()
                          : _menu == 2
                          ? TransactionHistoryPage()
                          : ProfilePage(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              child: Container(
                width: MediaQuery.of(context).size.width - 130,
                margin: const EdgeInsets.symmetric(horizontal: 65),
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: BottomMenu(menu: _menu, onChanged: changedMenu),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
