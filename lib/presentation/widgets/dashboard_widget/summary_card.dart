import 'package:atria_force_ssample/core/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SummaryCard extends StatelessWidget {
  final String icon;
  final String number;
  final String label;
  final Color? borderColor;
  final Color? numberColor;
  final Color? iconColor;
  final String? badge;
  final VoidCallback? onTap;
  final bool isSelected;

  const SummaryCard({
    super.key,
    required this.icon,
    required this.number,
    required this.label,
    this.borderColor,
    this.numberColor,
    this.iconColor,
    this.badge,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected  ? Palette.primaryRed : Colors.grey.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected 
                  ? Palette.primaryRed : Colors.grey.withOpacity(0.1),
              spreadRadius: isSelected ? 2 : 1,
           ),
          ],
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    icon,
                  ),
                  if (badge != null) ...[
                  Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          badge!,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.green[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                  ],
                ],
              ),
              const SizedBox(height: 22),
              Text(
                number,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: numberColor ?? Palette.textPrimary,
                ),
              ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Palette.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      ),
    );
  }
}

