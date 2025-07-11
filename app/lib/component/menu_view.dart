import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  final void Function()? onAlatKue;
  final void Function()? onAlatPesta;
  final void Function()? onBunga;
  final void Function()? onSemua;

  const MenuView({
    this.onAlatKue,
    this.onAlatPesta,
    this.onBunga,
    this.onSemua,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuIcon(
          img: 'ic_alat_kue.png',
          title: 'Alat Kue',
          onClick: () => onAlatKue,
        ),
        MenuIcon(
          img: 'ic_alat_pesta.png',
          title: 'Alat Pesta',
          onClick: () => onAlatPesta,
        ),
        MenuIcon(
          img: 'ic_alat_bunga.png',
          title: 'Bunga',
          onClick: () => onBunga,
        ),
        MenuIcon(img: 'ic_menu.png', title: 'Semua', onClick: () => onSemua),
      ],
    );
  }
}

class MenuIcon extends StatelessWidget {
  final String img;
  final String title;
  final VoidCallback onClick;

  const MenuIcon({
    required this.img,
    required this.title,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 72,
        height: 72,
        child: Column(
          children: [
            Image.asset('asset/icons/$img', width: 48, height: 48),
            SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
