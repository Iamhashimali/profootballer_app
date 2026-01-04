class UserSession {
  static String? email;
  static String? role;
  static bool isNewUser = false;

  static void startSession({
    required String userEmail,
    required String userRole,
    required bool newUser,
  }) {
    email = userEmail;
    role = userRole;
    isNewUser = newUser;
  }

  static void endSession() {
    email = null;
    role = null;
    isNewUser = false;
  }
}
