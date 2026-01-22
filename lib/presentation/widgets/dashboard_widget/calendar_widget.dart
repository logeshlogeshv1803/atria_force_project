import 'package:atria_force_ssample/core/constants/palette.dart';
import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const CalendarWidget({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Palette.primaryRed : Colors.grey,
          ),
          color: isSelected ? Colors.white : Palette.backgroundGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Palette.primaryRed : Palette.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

