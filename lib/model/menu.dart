import 'package:flutter/material.dart';

class MenuCategory {
  final String name;
  final List<MenuItem> items;

  const MenuCategory({required this.name, required this.items});
}

class MenuItem {
  final String name;
  final dynamic description;
  final dynamic image;
  final double price;
  final dynamic kcal;
  final bool isFasting;
  final bool isAvailable;
  final bool isPopular;

  const MenuItem({
    required this.name,
     this.description,
     this.image,
    required this.price,
     this.kcal,
    this.isFasting = false,
    this.isAvailable = true,
    this.isPopular = false,
  });
}
