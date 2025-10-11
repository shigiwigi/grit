import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grit - Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Grit', style: TextStyle(fontSize: 24, color: neonBlue)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the main stats screen after "login"
                context.go('/stats'); 
              },
              child: const Text('Simulate Login -> Stats'),
            ),
          ],
        ),
      ),
    );
  }
}
