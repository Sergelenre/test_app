import 'package:flutter/material.dart';
import 'package:test/sharedCustoms/custom_text.dart';

Widget OptionColumn({
  required IconData icon,
  required Color color,
  required String label,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: color, size: 28),
      SizedBox(height: 8),
      CustomText(text: label, fontSize: 12),
    ],
  );
}
