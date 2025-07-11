import 'package:flutter/material.dart';

class HeaderMenu extends StatelessWidget {
  final void Function()? onNotificationTap;
  final void Function()? onCartTap;
  final TextEditingController? searchController;

  const HeaderMenu({
    this.onNotificationTap,
    this.onCartTap,
    this.searchController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const SizedBox(width: 12),
        _buildIconWithBadge(
          image: 'ic_notif.png',
          onTap: onNotificationTap,
        ),
        const SizedBox(width: 12),
        _buildIconWithBadge(
          image: 'ic_cart.png',
          onTap: onCartTap,
        ),
      ],
    );
  }

  Widget _buildIconWithBadge({
    required String image,
    required VoidCallback? onTap,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            'asset/icons/$image',
            width: 28,
            height: 28,
            color: Colors.brown,
          ),
        ),
        Positioned(
          right: -2,
          top: -2,
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
