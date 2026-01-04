import 'dart:convert';
import 'package:crypto/crypto.dart';

class AuthService {

  // Store users → email : hashedPassword
  static final Map<String, String> _users = {};

  // ================== HASH FUNCTION ==================
  static String _hashPassword(String password, String salt) {
    final bytes = utf8.encode(password + salt);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // ================== SIGNUP ==================
  static String signup({
    required String username,
    required String email,
    required String password,
  }) {
    // Prevent duplicate users
    if (_users.containsKey(email)) {
      return "User already exists ❌";
    }

    // Generate salt (simple example)
    final salt = email; // unique per user

    // Hash password
    final hashedPassword = _hashPassword(password, salt);

    // Store hashed password
    _users[email] = hashedPassword;

    print("Signup success → $email");
    return "Signup successful ✅";
  }

  // ================== LOGIN ==================
  static String login({
    required String email,
    required String password,
  }) {
    // Check user exists
    if (!_users.containsKey(email)) {
      return "No user found ❌";
    }

    // Hash input password
    final salt = email;
    final hashedInputPassword = _hashPassword(password, salt);

    // Compare hashes
    if (_users[email] != hashedInputPassword) {
      return "Incorrect password ❌";
    }

    print("Login success → $email");
    return "Login successful ✅";
  }
}
