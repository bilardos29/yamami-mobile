import 'package:flutter/material.dart';

class ListReviewPage extends StatefulWidget {
  const ListReviewPage({super.key});

  @override
  State<ListReviewPage> createState() => _ListReviewPageState();
}

class _ListReviewPageState extends State<ListReviewPage> {
  int selectedRating = 0;

  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Courtney Henry',
      'date': '11 Februari 2023',
      'rating': 5,
      'comment':
          'Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor incididunt utau labore et dolore magna aliqua.Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor',
      'avatar': 'https://i.pravatar.cc/100?img=1',
    },
    {
      'name': 'Annette Black',
      'date': '11 Februari 2023',
      'rating': 4,
      'comment':
          'Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor incididunt utau labore et dolore magna aliqua.Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor',
      'avatar': 'https://i.pravatar.cc/100?img=2',
    },
    {
      'name': 'Robert Fox',
      'date': '11 Februari 2023',
      'rating': 3,
      'comment':
          'Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor incididunt utau labore et dolore magna aliqua.Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor',
      'avatar': 'https://i.pravatar.cc/100?img=3',
    },
    {
      'name': 'Kathryn Murphy',
      'date': '11 Februari 2023',
      'rating': 5,
      'comment':
          'Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor incididunt utau labore et dolore magna aliqua.Lorem ipsum dolor sit amet, conse dipiscing elit, sed do eiusmod tempor',
      'avatar': 'https://i.pravatar.cc/100?img=4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final rating = selectedRating == 0 ? 0 : 6 - selectedRating;

    final filtered =
        selectedRating == 0
            ? reviews
            : reviews.where((r) => r['rating'] == rating).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan'),
        leading: const BackButton(),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(6, (index) {
                  final rating = index == 0 ? 0 : 6 - index; // index 1 → 5, 2 → 4, dst
                  final label = index == 0 ? 'All' : '$rating ★';
                  final selected = selectedRating == index;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(label),
                      selected: selected,
                      showCheckmark: false,
                      selectedColor: const Color(0xFFD4A216),
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                      ),
                      onSelected: (_) {
                        setState(() {
                          selectedRating = index;
                        });
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const Divider(height: 32),
              itemBuilder: (context, index) {
                final r = filtered[index];
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(r['avatar']),
                          radius: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    r['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    r['date'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: List.generate(5, (i) {
                                  return Icon(
                                    i < r['rating']
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 16,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      r['comment'],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
