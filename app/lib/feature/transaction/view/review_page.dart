import 'package:app/component/main_button.dart';
import 'package:app/feature/transaction/view/completed_transaction_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        "image": "img_5.png",
        "name": "GR-BK-0081 Sprinkles sprinkle....",
        "variant": "Kuning"
      },
      {
        "image": "img_6.png",
        "name": "GR-BK-0081 Sprinkles sprinkle....",
        "variant": "Hijau"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: appText('Ulasan'),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ReviewCard(
              imageUrl: product["image"]!,
              productName: product["name"]!,
              variant: product["variant"]!,
            );
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: MainButton(text: 'Kirim', onPressed: (){
            nextPage(context, CompletedTransactionPage());
          }),
        ),
      ),
    );
  }
}

class ReviewCard extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String variant;

  const ReviewCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.variant,
  });

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  double rating = 0.0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'asset/images/${widget.imageUrl}',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.variant,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text("Rating Produk"),
          const SizedBox(height: 4),
          RatingBar(
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            ratingWidget: RatingWidget(
              full: const Icon(Icons.star, color: Colors.amber),
              empty: const Icon(Icons.star_border_outlined, color: Colors.grey),
              half: const Icon(Icons.star_half, color: Colors.amber), // optional
            ),
            onRatingUpdate: (value) {
              setState(() {
                rating = value;
              });
            },
          ),
          const SizedBox(height: 12),
          const Text("Ulasan"),
          const SizedBox(height: 6),
          TextField(
            controller: reviewController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Tulis ulasan",
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}