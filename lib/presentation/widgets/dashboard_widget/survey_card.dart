import 'package:atria_force_ssample/core/constants/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/palette.dart';

class SurveyCard extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isSelected;

  const SurveyCard({super.key, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width >= 768;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Palette.primaryRed : Palette.borderGrey,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: [
            BoxShadow(color: isSelected ? Palette.primaryRed : Colors.grey),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '08:30 AM',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Palette.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '1.5 hrs',
                  style: TextStyle(fontSize: 12, color: Palette.textSecondary),
                ),
              ],
            ),
            SizedBox(width: isWeb ? 100 : 80),
            Expanded(
              child: isWeb
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'AR-1531172',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Palette.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '560083',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Palette.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sanjeet Prakash Rao',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Palette.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '9876543201',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Palette.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'AR-1531172',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Palette.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '560083',
                          style: TextStyle(
                            fontSize: 12,
                            color: Palette.textSecondary,
                          ),
                        ),
                      ],
                    ),
            ),
            SvgPicture.asset(AssetSVGImages.sendIcon),
          ],
        ),
      ),
    );
  }
}
