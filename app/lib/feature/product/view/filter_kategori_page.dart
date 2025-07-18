import 'package:app/component/border_button.dart';
import 'package:app/component/main_button.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class FilterKategoriPage extends StatefulWidget {
  const FilterKategoriPage({super.key});

  @override
  State<FilterKategoriPage> createState() => _FilterKategoriPageState();
}

class _FilterKategoriPageState extends State<FilterKategoriPage> {
  List<String> subCategories = ['Alat Pesta 1', 'Alat Pesta 2'];
  List<bool> selected = [false, false];
  bool allSelected = false;

  void _reset() {
    setState(() {
      allSelected = false;
      selected = List.generate(subCategories.length, (_) => false);
    });
  }

  void _selectAll(bool? value) {
    setState(() {
      allSelected = value ?? false;
      selected = List.generate(subCategories.length, (_) => allSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Kategori Alat Pesta'),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari sub kategori',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          CheckboxListTile(
            title: const Text('Tampilkan Semua Produk'),
            value: allSelected,
            onChanged: _selectAll,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: subCategories.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(subCategories[index]),
                  value: selected[index],
                  onChanged: (value) {
                    setState(() {
                      selected[index] = value ?? false;
                      allSelected = selected.every((s) => s);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Row(
              children: [
                Expanded(child: BorderButton(text: 'Reset', onPressed: _reset)),
                const SizedBox(width: 12),
                Expanded(child: MainButton(text: 'Simpan', onPressed: () {
                  popPage(context);
                })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
