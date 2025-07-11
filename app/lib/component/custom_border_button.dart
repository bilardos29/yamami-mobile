import 'package:flutter/material.dart';

class CustomBorderButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomBorderButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFFF3E3B1) : Colors.white,
        foregroundColor: isSelected ? const Color(0xFF996B00) : Colors.grey,
        side: BorderSide(
          color: isSelected ? const Color(0xFF996B00) : Colors.grey.shade200,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}