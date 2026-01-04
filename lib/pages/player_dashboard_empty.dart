import 'package:flutter/material.dart';
import 'training_sessions.dart';  // Import the training sessions page
import 'log_match.dart';  // Import the log match page
import 'welcome_page.dart';  // Import the welcome page
import '../services/user_session.dart';  // Assuming user session service is inside the services folder

class PlayerDashboardEmpty extends StatelessWidget {
  const PlayerDashboardEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "ProFootballer",
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              UserSession.endSession(); // End user session
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const WelcomePage()),  // Redirect to welcome page
                    (_) => false,
              );
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),

      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 420),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.sports_soccer,
                size: 72,
                color: Color(0xFF22C55E),
              ),

              const SizedBox(height: 20),

              const Text(
                "Welcome to ProFootballer ⚽",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "You haven’t logged any training or matches yet.\nStart your journey by adding your first activity.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF475569),
                ),
              ),

              const SizedBox(height: 28),

              // Start Training Button
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TrainingSessionsPage(),  // Navigate to training sessions
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Start Training"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF22C55E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Log Match Button
              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LogMatchPage(),  // Navigate to log match page
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Log Match"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF22C55E),
                    side: const BorderSide(color: Color(0xFF22C55E)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}