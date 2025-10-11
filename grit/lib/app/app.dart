import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme.dart';
import '../features/stats/presentation/stats_screen.dart';
import '../features/nutrition/presentation/nutrition_screen.dart';
import '../features/body/presentation/body_metrics_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/workout/presentation/workout_screen.dart'; // New import

// --- Router Definition ---
final _router = GoRouter(
  // Start at Auth screen for a professional app setup
  initialLocation: '/auth/login',
  routes: [
    GoRoute(
      path: '/auth/login',
      builder: (context, state) => const LoginScreen(),
    ),
    // Main dashboard routes (accessed after login)
    GoRoute(
      path: '/stats',
      builder: (context, state) => const StatsScreen(),
    ),
    GoRoute(
      path: '/nutrition',
      builder: (context, state) => const NutritionScreen(),
    ),
    GoRoute(
      path: '/body',
      builder: (context, state) => const BodyMetricsScreen(),
    ),
    GoRoute(
      path: '/workout',
      builder: (context, state) => const WorkoutScreen(), 
    ),
  ],
);

class GritApp extends StatelessWidget {
  const GritApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Grit Fitness',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      routerConfig: _router,
    );
  }
}
