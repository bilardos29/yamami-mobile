import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final int menu;
  final ValueChanged<int> onChanged;

  const BottomMenu({required this.menu, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MenuIcon(
            image: 'ic_home.png',
            imageSelected: 'ic_home_selected.png',
            text: 'Beranda',
            isSelected: menu == 0,
            onClick: () => onChanged(0),
          ),
          MenuIcon(
            image: 'ic_wishlist.png',
            imageSelected: 'ic_wishlist_selected.png',
            text: 'Wishlist',
            isSelected: menu == 1,
            onClick: () => onChanged(1),
          ),
          MenuIcon(
            image: 'ic_transaksi.png',
            imageSelected: 'ic_transaksi_selected.png',
            text: 'Transaksi',
            isSelected: menu == 2,
            onClick: () => onChanged(2),
          ),
          MenuIcon(
            image: 'ic_profile.png',
            imageSelected: 'ic_profil_selected.png',
            text: 'Profile',
            isSelected: menu == 3,
            onClick: () => onChanged(3),
          ),
        ],
      ),
    );
  }
}

class MenuIcon extends StatelessWidget {
  final String image;
  final String imageSelected;
  final String text;
  final bool isSelected;
  final VoidCallback onClick;

  const MenuIcon({
    required this.image,
    required this.imageSelected,
    required this.text,
    this.isSelected = false,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: AnimatedContainer(
        height: 40,
        duration: const Duration(seconds: 10),
        curve: Curves.easeIn,
        padding:
            isSelected
                ? EdgeInsets.symmetric(horizontal: 12, vertical: 10)
                : null,
        decoration:
            isSelected
                ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                )
                : null,
        child: Row(
          children: [
            Image.asset(
              'asset/icons/${isSelected ? imageSelected : image}',
              width: 20,
              height: 20,
            ),
            SizedBox(width: 8),
            isSelected
                ? Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
