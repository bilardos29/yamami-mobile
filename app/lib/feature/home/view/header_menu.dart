import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class HeaderMenu extends StatelessWidget {
  final void Function()? onNotificationTap;
  final void Function()? onCartTap;
  final void Function()? onSearch;
  final TextEditingController? searchController;
  final bool isSearchOnFocus;
  final bool isDashboard;
  final String title;

  const HeaderMenu({
    this.onNotificationTap,
    this.onCartTap,
    this.onSearch,
    this.searchController,
    this.isSearchOnFocus = false,
    this.isDashboard = false,
    this.title = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) => isDashboard ? homeBar : topBar;

  Widget get homeBar => InkWell(
    onTap: onSearch,
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Cari Produk',
                      enabled: false,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        cekOnSearch,
      ],
    ),
  );

  Widget get topBar => Stack(
    children: [
      Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      cekOnSearch,
    ],
  );

  Widget get cekOnSearch =>
      isSearchOnFocus
          ? SizedBox()
          : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 12),
              buildIconWithBadge(
                image: 'ic_notif.png',
                onTap: onNotificationTap,
              ),
              const SizedBox(width: 12),
              buildIconWithBadge(image: 'ic_cart.png', onTap: onCartTap),
            ],
          );

}
