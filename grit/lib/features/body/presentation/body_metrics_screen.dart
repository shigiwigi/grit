import 'package:flutter/material.dart';
import '../../../theme.dart';

class BodyMetricsScreen extends StatelessWidget {
  const BodyMetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Body Tracking')),
      body: const Center(
        child: Text('Body Feature: Weight and Measurement Logging', style: TextStyle(color: neonBlue)),
      ),
    );
  }
}
