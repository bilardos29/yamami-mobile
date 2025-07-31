import 'package:app/component/custom_image_network.dart';
import 'package:app/feature/banner/view/banner_detail_page.dart';
import 'package:app/feature/home/model/banner_model.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class ListBannerPage extends StatefulWidget {
  final List<BannerModel> banner;

  const ListBannerPage({required this.banner, super.key});

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
            itemCount: widget.banner.length,
            itemBuilder: (ctx, idx) {
              return InkWell(
                onTap: () {
                  nextPage(
                    context,
                    BannerDetailPage(bannerId: widget.banner[idx].id ?? ''),
                  );
                },
                child: Container(
                  height: 145,
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CustomImageNetwork(widget.banner[idx].image ?? ''),
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
