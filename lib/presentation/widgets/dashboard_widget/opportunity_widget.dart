import 'package:flutter/material.dart';
import '../../../../core/constants/palette.dart';

class OpportunityWidget extends StatelessWidget {
  const OpportunityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
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
                  const Text(
                    'D R Mahesh',
                    style: TextStyle(
                      fontSize: 12,
                      color: Palette.textSecondary,
                    ),
                  ),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                'Proposal',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

