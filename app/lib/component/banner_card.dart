import 'dart:async';

import 'package:app/component/custom_image_network.dart';
import 'package:app/feature/home/model/banner_model.dart';
import 'package:flutter/material.dart';

class PromoBanner extends StatefulWidget {
  final List<BannerModel> banner;
  final VoidCallback onSeeAll;
  final ValueChanged<String> onClick;

  const PromoBanner({
    required this.banner,
    required this.onSeeAll,
    required this.onClick,
    super.key,
  });

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  late final PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoSwipeTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSwipe();
  }

  void _startAutoSwipe() {
    _autoSwipeTimer?.cancel();
    _autoSwipeTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        final nextIndex = (_currentIndex + 1) % widget.banner.length;
        _pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalBanner = widget.banner.length;

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: totalBanner,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (context, index) {
              final item = widget.banner[index];
              return InkWell(
                onTap: () {
                  widget.onClick(widget.banner[index].id ?? '');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CustomImageNetwork(item.image ?? ''),
                ),
              );
            },
          ),
          Positioned(
            bottom: 12,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Wrap(
                  spacing: 4,
                  children: List.generate(totalBanner, (index) {
                    final isActive = index == _currentIndex;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: isActive ? 20 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: isActive ? Colors.white : Colors.white60,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
                const Spacer(),
                InkWell(
                  onTap: widget.onSeeAll,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffB4870F),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: const Text(
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
        ],
      ),
    );
  }
}
