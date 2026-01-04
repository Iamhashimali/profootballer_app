import 'package:flutter/material.dart';

class TrainingSessionsPage extends StatelessWidget {
  const TrainingSessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Football Training Sessions"),
        backgroundColor: const Color(0xFF22C55E),
      ),
      body: ListView(
        children: [
          _buildTrainingCard("Drill 1: Passing Drills", "Improve your passing accuracy and control.", context),
          _buildTrainingCard("Drill 2: Dribbling Drills", "Work on your dribbling skills.", context),
          _buildTrainingCard("Drill 3: Shooting Drills", "Enhance your shooting power and precision.", context),
          _buildTrainingCard("Drill 4: Goalkeeping Drills", "Refine your reflexes and positioning.", context),
          _buildTrainingCard("Drill 5: Defending Drills", "Learn tackling techniques and positioning.", context),
        ],
      ),
    );
  }

  // Function to build each training card
  Widget _buildTrainingCard(String title, String description, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: () {
          // Log the selected drill to the console
          print('Drill selected: $title');
          // Show the dialog for the selected drill
          _showStartSessionDialog(context, title);
        },
      ),
    );
  }

  // Function to show the dialog
  void _showStartSessionDialog(BuildContext context, String drillTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Start Session for $drillTitle"),
          content: const Text("Would you like to start the training session?"),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
                // Log session start to the console
                print('Training session started: $drillTitle');
                // Show notification that the session started
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Session started successfully, calculating performance."),
                  ),
                );
              },
              child: const Text("Start"),
            ),
          ],
        );
      },
    );
  }
}
