import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'player_dashboard_empty.dart';
import '../services/auth_service.dart';  // Assuming the service is inside services folder
import '../services/user_session.dart';  // Assuming user session service is defined here

class LoginPage extends StatelessWidget {
  // Controllers for the form fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        child: Center(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF1F2937),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.emoji_events,
                  size: 56,
                  color: Color(0xFF22C55E),
                ),
                const SizedBox(height: 16),
                const Text(
                  "ProFootballer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Elite Training & Performance Tracking",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 24),

                // Email input field
                _inputField("Email address", controller: emailController),
                const SizedBox(height: 14),

                // Password input field
                _inputField("Password", controller: passwordController, isPassword: true),
                const SizedBox(height: 20),

                // Login button
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF22C55E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Email and password required ❌")),
                        );
                        return;
                      }

                      // Log the login attempt details
                      print('Login attempt:');
                      print('Email: $email');
                      print('Password: $password');  // Be cautious with logging passwords

                      // Attempt to login using AuthService
                      final result = AuthService.login(email: email, password: password);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));

                      if (result == "Login successful ✅") {
                        // Log the session start details
                        print('Login successful for user: $email');
                        UserSession.startSession(userEmail: email, userRole: "player", newUser: false);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PlayerDashboardEmpty(),
                          ),
                        );
                      }
                    },
                    child: const Text("Sign In", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  ),
                ),

                const SizedBox(height: 14),

                // Signup link
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupPage()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(color: Color(0xFF22C55E), fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function for input fields (email, password)
  static Widget _inputField(
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
