import 'package:app/component/main_button.dart';
import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final List<String> images;
  final int currentIndex;
  final int totalBanner;
  final VoidCallback onClick;
  final VoidCallback onSeeAll;

  const PromoBanner({
    super.key,
    required this.images,
    this.currentIndex = 0,
    this.totalBanner = 4,
    required this.onClick,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 145,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD84F),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage('asset/banner/${images[currentIndex]}'),
            alignment: Alignment.centerRight,
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              alignment: WrapAlignment.start,
              spacing: 4,
              children: List.generate(totalBanner, (index) {
                final isActive = index == currentIndex;
                return Container(
                  width: isActive ? 20 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : Colors.white60,
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),
            Spacer(),
            InkWell(
              onTap: onSeeAll,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffB4870F),
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  'Lihat Semua',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
