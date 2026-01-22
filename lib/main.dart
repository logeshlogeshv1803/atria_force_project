import 'package:flutter/material.dart';
import 'core/constants/palette.dart';
import 'presentation/views/dashboard/dashboard_views.dart';

void main() {
  runApp(const AtriaForceApp());
}

class AtriaForceApp extends StatelessWidget {
  const AtriaForceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATRIAFORCE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Palette.backgroundGrey,
        fontFamily: 'inter',
      ),
      home: const DashboardScreen(),
    );
  }
}
