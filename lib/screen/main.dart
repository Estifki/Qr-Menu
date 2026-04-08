import 'package:flutter/material.dart';
import 'package:qr_menu/widget/category_card.dart';
import '../const/sample.dart';
import '../const/theme.dart';
import '../model/menu.dart';
import '../widget/search.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<MenuCategory> allCategories = sampleCategories;

  List<MenuCategory> filteredCategories = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    filteredCategories = allCategories;

    searchController.addListener(filterMenu);
  }

  void filterMenu() {
    final query = searchController.text.toLowerCase();

    if (query.isEmpty) {
      setState(() {
        filteredCategories = allCategories;
      });
      return;
    }

    final results = allCategories
        .map((category) {
          final filteredItems = category.items.where((item) {
            return item.name.toLowerCase().contains(query) ||
                (item.description != null &&
                    item.description.toString().toLowerCase().contains(query));
          }).toList();

          return MenuCategory(name: category.name, items: filteredItems);
        })
        .where((category) {
          return category.items.isNotEmpty;
        })
        .toList();

    setState(() {
      filteredCategories = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Our Menu",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent,
                ),
              ),
            ),

            const SizedBox(height: 6),

            const Center(
              child: Text(
                "All items are 15% VAT inclusive",
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),

            const SizedBox(height: 20),

            buildSearchBar(searchController),

            const SizedBox(height: 10),

            ...filteredCategories.map(
              (category) => CategoryCardWidget(category: category),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
