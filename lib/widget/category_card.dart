import 'package:flutter/material.dart';
import 'package:qr_menu/const/theme.dart';
import 'package:qr_menu/widget/menu_item.dart';

import '../model/menu.dart';

class CategoryCardWidget extends StatefulWidget {
  final MenuCategory category;

  const CategoryCardWidget({super.key, required this.category});

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.category.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  AnimatedRotation(
                    duration: const Duration(milliseconds: 250),
                    turns: isExpanded ? 0.5 : 0,
                    child: const Icon(Icons.expand_more),
                  ),
                ],
              ),
            ),
          ),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isExpanded
                ? Column(
                    children: widget.category.items.map(buildMenuItem).toList(),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
