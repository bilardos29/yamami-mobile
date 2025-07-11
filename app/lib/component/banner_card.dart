import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String image;
  final int currentIndex;
  final int totalBanner;
  final VoidCallback onClick;

  const PromoBanner({
    super.key,
    required this.image,
    this.currentIndex = 0,
    this.totalBanner = 4,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD84F),
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: AssetImage('asset/images/$image'),
            alignment: Alignment.centerRight,
            fit: BoxFit.contain,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalBanner, (index) {
            final isActive = index == currentIndex;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: isActive ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive ? Colors.white : Colors.white60,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ),
    );
  }
}
