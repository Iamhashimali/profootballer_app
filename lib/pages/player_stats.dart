import 'package:flutter/material.dart';
class PlayerStats extends StatelessWidget {
  const PlayerStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Player Stats")),
      body: const Center(
        child: Text(
          "Player Performance Statistics\n(Goals, Assists, Fitness)",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
