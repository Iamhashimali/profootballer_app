import 'package:flutter/material.dart';
import 'package:profootballer_app/pages/login_page.dart';
import 'package:profootballer_app/pages/signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0B1220),
              Color(0xFF0E1A2B),
              Color(0xFF08101E),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.emoji_events,
                color: Colors.white,
                size: 40,
              ),
            ),

            const SizedBox(height: 24),

            // Title
            const Text(
              "ProFootballer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Subtitle
            const Text(
              "Train like a pro. Track like a legend.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 40),

            // Login Button
            SizedBox(
              width: 260,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPage()),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Sign Up Button
            SizedBox(
              width: 260,
              height: 48,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF1F2937),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide.none,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignupPage()),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
