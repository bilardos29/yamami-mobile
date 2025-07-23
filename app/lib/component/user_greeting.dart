import 'package:flutter/material.dart';

class UserGreeting extends StatelessWidget {
  final String userName;
  final String? imageUrl;
  final String email;
  final bool isLargeImage;

  const UserGreeting({
    Key? key,
    required this.userName,
    this.imageUrl,
    this.email = '',
    this.isLargeImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: isLargeImage ? 64 : 44,
          height: isLargeImage ? 64 : 44,
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isLargeImage ? 32 : 22),
            color: Color(0xFF999999),
          ),
          child: CircleAvatar(
            radius: isLargeImage ? 32 : 22,
            backgroundColor: Colors.black12,
            backgroundImage:
                imageUrl == null
                    ? AssetImage('asset/images/user.png')
                    : NetworkImage(imageUrl!),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: isLargeImage ? 18 : 14,
                    color: Colors.black87,
                  ),
                  children: [
                    const TextSpan(text: 'Hi, '),
                    TextSpan(
                      text: userName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              if (email.isNotEmpty) ...[
                SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(color: Color(0xff8C867D), fontSize: 14),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
