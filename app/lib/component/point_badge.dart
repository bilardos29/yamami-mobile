import 'package:flutter/material.dart';

class PointBadge extends StatelessWidget {
  final int point;

  const PointBadge({
    Key? key,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFFD700), Color(0xFFFFC107)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),

            // 💬 Text Point
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: point.toString().replaceAllMapped(
                      RegExp(r'\B(?=(\d{3})+(?!\d))'),
                          (match) => '.',
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const TextSpan(
                    text: ' Poin',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}