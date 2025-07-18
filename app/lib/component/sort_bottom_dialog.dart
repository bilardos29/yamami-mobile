import 'package:app/component/border_button.dart';
import 'package:app/component/main_button.dart';
import 'package:flutter/material.dart';

class SortBottomDialog extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onSelect;

  const SortBottomDialog({
    Key? key,
    required this.selectedIndex,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<SortBottomDialog> createState() => _SortBottomDialogState();
}

class _SortBottomDialogState extends State<SortBottomDialog> {
  late int _selected;

  final List<String> _options = [
    "Paling Sesuai",
    "Ulasan",
    "Terbaru",
    "Harga Tertinggi",
    "Harga Terendah",
  ];

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Urutkan Berdasarkan",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 24),
          ...List.generate(_options.length * 2 - 1, (index) {
            if (index.isOdd) {
              return const Divider(height: 0.3);
            }

            final itemIndex = index ~/ 2;
            final isSelected = itemIndex == _selected;

            return ListTile(
              title: Text(_options[itemIndex]),
              trailing:
                  isSelected
                      ? const Icon(Icons.check_circle, color: Color(0xFFD4A216))
                      : null,
              onTap: () {
                setState(() {
                  _selected = itemIndex;
                });
              },
            );
          }),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: MainButton(
                  text: 'Kembali',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: BorderButton(
                  text: 'Ya',
                  onPressed: () {
                    widget.onSelect(_selected);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
