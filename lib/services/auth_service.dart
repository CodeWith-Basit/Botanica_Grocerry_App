import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser {
  static FirebaseAuth get _auth => FirebaseAuth.instance;

  /// Returns the current Firebase User (or null if not logged in)
  static User? get user => _auth.currentUser;

  /// Returns the UID directly (or null if not logged in)
  static String? get uid => _auth.currentUser?.uid;

  /// Check if user is logged in
  static bool get isLoggedIn => _auth.currentUser != null;
}
