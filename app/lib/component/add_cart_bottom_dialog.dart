import 'package:app/component/main_button.dart';
import 'package:flutter/material.dart';

class AddCartBottomDialog extends StatefulWidget {
  final String modeCart;

  const AddCartBottomDialog({required this.modeCart, super.key});

  @override
  State<AddCartBottomDialog> createState() => _AddCartBottomDialogState();
}

class _AddCartBottomDialogState extends State<AddCartBottomDialog> {
  int selectedVariant = 0;
  int selectedSize = 0;
  int quantity = 1;

  final List<String> variants = [
    "Variasi 1",
    "Variasi 2",
    "Variasi 3",
    "Variasi 4",
  ];
  final List<String> sizes = ["Size 1", "Size 2", "Size 3", "Size 4", "Size 5"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tambah Ke Keranjang",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 12),
          buildLabel("Variasi"),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            children: List.generate(variants.length, (index) {
              final isSelected = index == selectedVariant;
              return ChoiceChip(
                label: Text(variants[index]),
                selected: isSelected,
                showCheckmark: false,
                selectedColor: const Color(0xFFD4A216),
                padding: EdgeInsets.all(4),
                visualDensity: VisualDensity.compact,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                onSelected: (_) {
                  setState(() {
                    selectedVariant = index;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 16),
          buildLabel("Size (Tersisa 1)"),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            children: List.generate(sizes.length, (index) {
              final isSelected = index == selectedSize;
              return ChoiceChip(
                label: Text(sizes[index]),
                selected: isSelected,
                showCheckmark: false,
                selectedColor: const Color(0xFFD4A216),
                padding: EdgeInsets.all(4),
                visualDensity: VisualDensity.compact,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                onSelected: (_) {
                  setState(() {
                    selectedSize = index;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() => quantity--);
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$quantity', style: const TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: () {
                        setState(() => quantity++);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: MainButton(
                  text:
                      widget.modeCart == 'Cart'
                          ? 'Tambahkan ke Keranjang'
                          : 'Beli Sekarang',
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Tambahkan logika tambah ke keranjang
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xff8C867D),
          fontSize: 12,
        ),
      ),
    );
  }
}
