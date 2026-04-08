// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:qr_menu/model/menu.dart';

import '../const/theme.dart';

Widget buildMenuItem(MenuItem item) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.divider),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Text(
              "${item.price.toStringAsFixed(0)} ETB",
              style: TextStyle(
                // decoration: !item.isAvailable
                //     ? TextDecoration.lineThrough
                //     : null,
                // decorationColor: Colors.red,
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        Text(
          item.description ?? "",
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            item.kcal == null || item.kcal == ""
                ? SizedBox.shrink()
                : Text(
                    "${item.kcal} KCAL",
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),

            const Spacer(),

            if (!item.isAvailable)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Unavailable",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),
        SizedBox(height: 10),
        item.image != null && item.image != ""
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.image,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            : SizedBox.shrink(),
      ],
    ),
  );
}

// Widget buildMenuItem(MenuItem item) {
//   final bool isUnavailable = !item.isAvailable;

//   return Opacity(
//     opacity: isUnavailable ? 0.6 : 1,
//     child: Stack(
//       children: [
//         /// CARD
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//           padding: const EdgeInsets.all(14),
//           decoration: BoxDecoration(
//             color: isUnavailable ? Colors.grey.shade900 : Colors.black,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(
//               color: isUnavailable
//                   ? Colors.red.withOpacity(.4)
//                   : AppColors.divider,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// IMAGE
//               if (item.image != null && item.image != "")
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: ColorFiltered(
//                     colorFilter: isUnavailable
//                         ? const ColorFilter.mode(
//                             Colors.grey,
//                             BlendMode.saturation,
//                           )
//                         : const ColorFilter.mode(
//                             Colors.transparent,
//                             BlendMode.multiply,
//                           ),
//                     child: Image.asset(
//                       item.image!,
//                       height: 160,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),

//               const SizedBox(height: 12),

//               /// TITLE + PRICE
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       item.name,
//                       style: TextStyle(
//                         color: isUnavailable ? Colors.grey : Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),

//                   Text(
//                     "${item.price.toStringAsFixed(0)} ETB",
//                     style: TextStyle(
//                       color: isUnavailable ? Colors.grey : AppColors.accent,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 6),

//               /// DESCRIPTION
//               if (item.description != null)
//                 Text(
//                   item.description!,
//                   style: TextStyle(
//                     color: isUnavailable
//                         ? Colors.grey.shade600
//                         : AppColors.textSecondary,
//                     fontSize: 14,
//                   ),
//                 ),

//               const SizedBox(height: 8),

//               /// KCAL
//               if (item.kcal != null)
//                 Text(
//                   "${item.kcal} KCAL",
//                   style: TextStyle(
//                     color: isUnavailable
//                         ? Colors.grey.shade600
//                         : AppColors.textSecondary,
//                     fontSize: 12,
//                   ),
//                 ),
//             ],
//           ),
//         ),

//         /// CENTER OVERLAY LABEL
//         if (isUnavailable)
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: Colors.black.withOpacity(.4),
//               ),
//               child: Center(
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 18,
//                     vertical: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Text(
//                     "UNAVAILABLE",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     ),
//   );
// }
