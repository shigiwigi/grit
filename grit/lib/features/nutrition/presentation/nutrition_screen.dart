import 'package:flutter/material.dart';
import '../../../theme.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nutrition & Calorie Tracking')),
      body: const Center(
        child: Text('Nutrition Feature: Calorie Tracking Dashboard', style: TextStyle(color: neonBlue)),
      ),
    );
  }
}
