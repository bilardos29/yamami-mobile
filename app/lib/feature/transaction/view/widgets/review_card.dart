import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('asset/images/img_7.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Bessie Cooper'), Text('11 Februari 2023')],
            ),
            const Spacer(),
            RatingBar(
              initialRating: 5,
              itemCount: 5,
              maxRating: 5,
              itemSize: 16,
              ratingWidget: RatingWidget(
                full: const Icon(Icons.star, color: Colors.amber),
                empty: const Icon(
                  Icons.star_border_outlined,
                  color: Colors.grey,
                ),
                half: const Icon(
                  Icons.star_half,
                  color: Colors.amber,
                ), // optional
              ),
              onRatingUpdate: (double value) {},
            ),
          ],
        ),
        SizedBox(height: 14),
        Text(
          'Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor incididunt...',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
