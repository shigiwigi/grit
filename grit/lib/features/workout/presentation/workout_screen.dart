import 'package:flutter/material.dart';
import '../../../theme.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Timer & Duration')),
      body: const Center(
        child: Text('Workout Feature: Active Session Tracking', style: TextStyle(color: neonBlue)),
      ),
    );
  }
}
