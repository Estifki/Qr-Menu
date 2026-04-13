import 'package:flutter/material.dart';

import '../const/theme.dart';

Widget buildSearchBar(TextEditingController controller) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    height: 52,
    decoration: BoxDecoration(
      // ignore: deprecated_member_use
      color: AppColors.card.withOpacity(0.2),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.card, width: 2),
    ),
    child: Row(
      children: [
        const Icon(Icons.search, color: Colors.white),

        const SizedBox(width: 12),

        Expanded(
          child: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),

            decoration: const InputDecoration(
              hintText: "Search menu...",
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}
