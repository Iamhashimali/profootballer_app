import 'package:flutter/material.dart';

class LogMatchPage extends StatefulWidget {
  const LogMatchPage({super.key});

  @override
  _LogMatchPageState createState() => _LogMatchPageState();
}

class _LogMatchPageState extends State<LogMatchPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _team1Controller = TextEditingController();
  final TextEditingController _team2Controller = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _goalsController = TextEditingController();
  final TextEditingController _assistsController = TextEditingController();
  final TextEditingController _passCompletionController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  // For the uploaded clip (simulating the functionality)
  final TextEditingController _clipUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Match Details"),
        backgroundColor: const Color(0xFF22C55E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Match Info Section
              TextFormField(
                controller: _team1Controller,
                decoration: const InputDecoration(labelText: 'Team 1'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter team 1 name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _team2Controller,
                decoration: const InputDecoration(labelText: 'Team 2'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter team 2 name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _scoreController,
                decoration: const InputDecoration(labelText: 'Score (e.g., 3-2)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the match score';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Match Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the match date';
                  }
                  return null;
                },
              ),

              // Match Performance Section
              TextFormField(
                controller: _goalsController,
                decoration: const InputDecoration(labelText: 'Goals Scored'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _assistsController,
                decoration: const InputDecoration(labelText: 'Assists'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _passCompletionController,
                decoration: const InputDecoration(labelText: 'Pass Completion (%)'),
                keyboardType: TextInputType.number,
              ),

              // Feedback Section
              TextFormField(
                controller: _feedbackController,
                decoration: const InputDecoration(labelText: 'Coach/Teammate Feedback'),
                maxLines: 4,
              ),

              // Clip Upload Section (simulating with a URL)
              TextFormField(
                controller: _clipUrlController,
                decoration: const InputDecoration(labelText: 'Match Clip URL (optional)'),
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Log match details to the console
                    print('Match Logged:');
                    print('Team 1: ${_team1Controller.text}');
                    print('Team 2: ${_team2Controller.text}');
                    print('Score: ${_scoreController.text}');
                    print('Match Date: ${_dateController.text}');
                    print('Goals Scored: ${_goalsController.text}');
                    print('Assists: ${_assistsController.text}');
                    print('Pass Completion: ${_passCompletionController.text}');
                    print('Feedback: ${_feedbackController.text}');
                    print('Clip URL: ${_clipUrlController.text}');

                    // Show a snack bar confirmation
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Match Logged')),
                    );
                    // Clear form after submission
                    _clearForm();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to clear form after submission
  void _clearForm() {
    _team1Controller.clear();
    _team2Controller.clear();
    _scoreController.clear();
    _dateController.clear();
    _goalsController.clear();
    _assistsController.clear();
    _passCompletionController.clear();
    _feedbackController.clear();
    _clipUrlController.clear();
  }
}
