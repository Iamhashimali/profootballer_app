import 'package:flutter/material.dart';
import 'welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WelcomePage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            // Logo box
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

            const SizedBox(height: 20),

            // App name
            const Text(
              "ProFootballer Inc.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            // Animated loading line
            SizedBox(
              width: 160,
              height: 3,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 160 * _animation.value,
                      height: 3,
                      decoration: BoxDecoration(
                        color: const Color(0xFF22C55E),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
