import 'package:app/feature/banner/view/banner_detail_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class ListBannerPage extends StatefulWidget {
  final List<String> images;

  const ListBannerPage({required this.images, super.key});

  @override
  State<ListBannerPage> createState() => _ListBannerPageState();
}

class _ListBannerPageState extends State<ListBannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Semua Banner')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: widget.images.length,
            itemBuilder: (ctx, idx) {
              return InkWell(
                onTap: (){
                  nextPage(context, BannerDetailPage(image: widget.images[idx]));
                },
                child: Container(
                  height: 145,
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD84F),
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage('asset/banner/${widget.images[idx]}'),
                      alignment: Alignment.centerRight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
