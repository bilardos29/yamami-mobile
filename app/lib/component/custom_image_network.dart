import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageNetwork extends StatelessWidget {
  final String image;

  const CustomImageNetwork(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          (image.isNotEmpty)
              ? (!image.contains('cdn.example.com') ? image : '')
              : '',
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget:
          (context, url, error) => Container(
            color: Colors.grey[600],
            alignment: Alignment.center,
            child: const Icon(Icons.image, color: Colors.white, size: 40),
          ),
    );
  }
}
