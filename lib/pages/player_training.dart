import 'package:flutter/material.dart';

class PlayerTraining extends StatelessWidget {
  const PlayerTraining({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
            children: const [
              _DrillCard(
                title: "High Intensity Dribbling",
                duration: "20 mins",
                type: "Technique",
              ),
              _DrillCard(
                title: "Box-to-Box Endurance",
                duration: "45 mins",
                type: "Fitness",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrillCard extends StatelessWidget {
  final String title, duration, type;

  const _DrillCard({
    required this.title,
    required this.duration,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color(0xFF1F2937),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              duration,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF22C55E), // Green color for the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Implement start training logic
              },
              child: const Text(
                "Start Training",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
