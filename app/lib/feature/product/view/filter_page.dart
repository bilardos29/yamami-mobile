import 'package:app/component/border_button.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/product/view/filter_kategori_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  int selectedCategoryIndex = 0;
  int selectedLocationIndex = 0;

  final List<String> categories = [
    'Semua Produk',
    'Alat Kue',
    'Alat Pesta',
    'Bunga',
  ];

  final List<String> locations = [
    'Semua',
    'Yamama Bandung',
    'Yamama Surabaya',
    'Yamama Jakarta',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Filter')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: minPriceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Min',
                            prefixText: 'Rp ',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text('-'),
                      const SizedBox(width: 12),
                      Flexible(
                        child: TextField(
                          controller: maxPriceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Max',
                            prefixText: 'Rp ',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 20, color: Colors.black12),
                  const SizedBox(height: 12),
                  const Text(
                    'Kategori',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(categories.length * 2 - 1, (index) {
                    if (index.isOdd) {
                      return const Divider(height: 1, color: Colors.black12);
                    }

                    final itemIndex = index ~/ 2;
                    final isSelected = itemIndex == selectedCategoryIndex;

                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        categories[itemIndex],
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(
                        isSelected ? Icons.check_circle : Icons.navigate_next,
                        color: Color(0xFFD4A216),
                      ),
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = itemIndex;
                          if(selectedCategoryIndex == 1){
                            nextPage(context, FilterKategoriPage());
                          }
                        });
                      },
                    );
                  }),
                  const Divider(height: 20, color: Colors.black12),
                  const SizedBox(height: 10),
                  const Text(
                    'Lokasi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(locations.length, (index) {
                      final isSelected = selectedLocationIndex == index;
                      return ChoiceChip(
                        label: Text(
                          locations[index],
                          style: TextStyle(
                            color:
                                isSelected ? Color(0xffB4870F) : Colors.black,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: const Color(0xFFF2DFB3),
                        backgroundColor: Colors.grey[200],
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        onSelected: (_) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: BorderButton(
                    text: 'Reset',
                    onPressed: () {
                      setState(() {
                        minPriceController.clear();
                        maxPriceController.clear();
                        selectedCategoryIndex = 0;
                        selectedLocationIndex = 0;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: MainButton(
                    text: 'Terapkan',
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}