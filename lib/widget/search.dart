import 'package:flutter/material.dart';

import '../const/theme.dart';

Widget buildSearchBar(
    TextEditingController controller) {

  return Container(
    margin:
        const EdgeInsets.symmetric(horizontal: 16),
    padding:
        const EdgeInsets.symmetric(horizontal: 16),
    height: 52,
    decoration: BoxDecoration(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(14),
      border:
          Border.all(color: AppColors.divider),
    ),
    child: Row(
      children: [

        const Icon(Icons.search,
            color: AppColors.textSecondary),

        const SizedBox(width: 12),

        Expanded(
          child: TextField(
            controller: controller,
            style:
                const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Search menu...",
              hintStyle: TextStyle(
                  color: AppColors.textSecondary),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}