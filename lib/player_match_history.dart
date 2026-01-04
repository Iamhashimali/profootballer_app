import 'package:flutter/material.dart';

class PlayerMatchHistory extends StatelessWidget {
  const PlayerMatchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Match History")),
      body: const Center(
        child: Text(
          "Match History & Ratings\n(Logged matches appear here)",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
