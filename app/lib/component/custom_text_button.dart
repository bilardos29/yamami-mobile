import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final bool disable;

  const CustomTextButton({
    required this.text,
    required this.onClick,
    this.disable = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !disable ? onClick : null,
      child: Text(
        text,
        style: TextStyle(
          color: !disable ? Theme.of(context).colorScheme.primary : Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
