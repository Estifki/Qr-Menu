import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_menu/controller/global.dart';
import 'package:qr_menu/widget/category_card.dart';

import '../const/theme.dart';
import '../model/menu.dart';
import '../widget/search.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late Future _menuData;
  List<MenuCategory> allCategories = [];

  List<MenuCategory> filteredCategories = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _menuData = context.read<GlobalProvider>().getItems();

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
                    item.description!.toLowerCase().contains(query)) ||
                category.name.toLowerCase().contains(query); // 🔥 NEW
          }).toList();

          return MenuCategory(
            id: category.id,
            name: category.name,
            items: filteredItems,
          );
        })
        .where((category) => category.items.isNotEmpty)
        .toList();

    setState(() {
      filteredCategories = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _menuData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text("Failed to load menu"));
            }

            /// 🔥 GET DATA FROM PROVIDER
            final categories = context.watch<GlobalProvider>().categories;

            if (allCategories.isEmpty && categories.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  allCategories = categories;
                  filteredCategories = categories;
                });
              });
            }

            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.gradientColorOne,
                    AppColors.gradientColorTwo,
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: ListView(
                children: [
                  const SizedBox(height: 40),

                  Image.asset(
                    "lib/assets/logo.png",
                    height: 120,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 20),

                  const Center(
                    child: Text(
                      "Our Menu",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.card,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Center(
                    child: Text(
                      "All items are 15% VAT inclusive",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),

                  const SizedBox(height: 20),

                  buildSearchBar(searchController),

                  const SizedBox(height: 10),

                  /// 🔥 EMPTY STATE
                  if (filteredCategories.isEmpty)
                    const Center(child: Text("No items found")),

                  ...filteredCategories.map(
                    (category) => CategoryCardWidget(category: category),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
