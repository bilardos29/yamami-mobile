import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  final List<CategoryData> categories = [
    CategoryData("Alat Kue", ["Semua Alat Kue", "Alat Kue 1"]),
    CategoryData("Alat Pesta", []),
    CategoryData("Bunga", []),
  ];

  @override
  Widget build(BuildContext context) {
    final themeColor = const Color(0xFFC29620);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Semua Kategori',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController,
              onChanged:
                  (value) => setState(() => searchQuery = value.toLowerCase()),
              decoration: InputDecoration(
                hintText: 'Cari kategori',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 📂 Category List
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];

                final filteredSub =
                    cat.subCategories!
                        .where((s) => s.toLowerCase().contains(searchQuery))
                        .toList();

                final shouldShow =
                    cat.name!.toLowerCase().contains(searchQuery) ||
                    filteredSub.isNotEmpty ||
                    searchQuery.isEmpty;

                if (!shouldShow) return const SizedBox.shrink();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        cat.name ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        cat.isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: themeColor,
                      ),
                      onTap:
                          () =>
                              setState(() => cat.isExpanded = !cat.isExpanded),
                    ),
                    if (cat.isExpanded)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              filteredSub.map((sub) {
                                return Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(sub),
                                      onTap: () {
                                        // Navigasi ke produk berdasarkan kategori
                                      },
                                    ),
                                    const Divider(height: 1),
                                  ],
                                );
                              }).toList(),
                        ),
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
class CategoryData {
  String? name;
  List<String>? subCategories;
  bool isExpanded = false;

  CategoryData(this.name, this.subCategories);
}
