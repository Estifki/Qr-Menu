import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:qr_menu/const/const.dart';
import 'package:qr_menu/model/menu.dart';
import 'package:qr_menu/utils/api_request.dart';
import 'package:qr_menu/utils/exception.dart';

class GlobalProvider with ChangeNotifier {
  List<MenuCategory> _categories = [];
  List<MenuCategory> get categories => _categories;

  List<MenuItem> _items = [];
  List<MenuItem> get items => _items;

  //
  //GET ITEMS
  //
  Future<void> getItems() async {
    try {
      dio.Response response = await ApiRequest().getRequest(
        requestUrl: "$RESTURANTURL/categories.json",
      );

      if (response.statusCode == 200) {
        final data = response.data as Map?;

        _items = [];
        _categories = [];

        /// ✅ HANDLE NULL
        if (data == null) {
          notifyListeners();
          return;
        }

        data.forEach((catId, catData) {
          final categoryMap = Map<String, dynamic>.from(catData);

          List<MenuItem> items = [];

          /// 🔥 ITEMS INSIDE CATEGORY
          if (categoryMap['items'] != null) {
            final itemsMap = Map<String, dynamic>.from(categoryMap['items']);

            itemsMap.forEach((itemId, itemData) {
              final item = MenuItem.fromJson(
                id: itemId,
                categoryId: catId,
                categoryName: categoryMap['categoryName'] ?? "",
                json: Map<String, dynamic>.from(itemData),
              );

              items.add(item);
              _items.add(item); // 🔥 also add to flat list
            });
          }

          /// 🔥 ADD CATEGORY WITH ITS ITEMS
          _categories.add(
            MenuCategory(
              id: catId,
              name: categoryMap['categoryName'] ?? "",
              items: items,
            ),
          );
        });

        /// 🔥 SORTING (optional)
        _items = _items.reversed.toList();
        _categories = _categories.reversed.toList();

        notifyListeners();
      } else {
        throw CustomException("Failed to fetch items");
      }
    } catch (e) {
      rethrow;
    }
  }
}
