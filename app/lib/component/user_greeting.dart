import 'package:flutter/material.dart';

class UserGreeting extends StatelessWidget {
  final String userName;
  final String imageUrl;

  const UserGreeting({Key? key, required this.userName, required this.imageUrl})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Color(0xFF999999),
          ),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            children: [
              const TextSpan(text: 'Hi, '),
              TextSpan(
                text: userName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
