import 'package:flutter/material.dart';
import 'login_page.dart';
import 'player_dashboard_empty.dart';
import '../services/auth_service.dart';
import '../services/user_session.dart';  // Ensure the import is correct

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers for the form fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Selected role, default is player
  String selectedRole = "player";

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
          children: [
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text("← Back", style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    },
                    child: const Text("Login →", style: TextStyle(color: Color(0xFF22C55E), fontSize: 13, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Heading and description
            const Text(
              "Create Account",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Join the elite football community.",
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),

            const SizedBox(height: 28),

            // Form to input user data
            Container(
              width: 340,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username field
                  _label("Username"),
                  _input("Enter your username", controller: usernameController),

                  const SizedBox(height: 16),

                  // Email field
                  _label("Email"),
                  _input("example@example.com", controller: emailController),

                  const SizedBox(height: 16),

                  // Password field
                  _label("Password"),
                  _input("Min 8 characters", controller: passwordController, isPassword: true),

                  const SizedBox(height: 18),

                  // Role selection (Player/Coach)
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedRole == "player"
                                ? const Color(0xFF22C55E)
                                : const Color(0xFF334155),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedRole = "player";
                            });
                          },
                          child: const Text("Player"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedRole == "coach"
                                ? const Color(0xFF22C55E)
                                : const Color(0xFF334155),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedRole = "coach";
                            });
                          },
                          child: const Text("Coach"),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // Sign Up button
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF22C55E),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: _handleSignup,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Sign-up logic
  void _handleSignup() {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("All fields are required ❌")));
      return;
    }

    final result = AuthService.signup(
      email: email,
      password: password,
      username: username,  // Pass username to the signup method
    );

    // Log signup details to the console
    print('User signed up:');
    print('Username: $username');
    print('Email: $email');
    print('Password: $password'); // Be cautious with logging passwords

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));

    if (result == "User signup successful ✅") {
      UserSession.startSession(userEmail: email, userRole: selectedRole, newUser: true);
      // Log session start to the console
      print('User session started for $username with role: $selectedRole');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PlayerDashboardEmpty()),
      );
    }
  }

  // Helper for input labels
  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  // Helper for input fields (email, password, etc.)
  Widget _input(
      String hint, {
        required TextEditingController controller,
        bool isPassword = false,
      }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: const Color(0xFF334155),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }
}
