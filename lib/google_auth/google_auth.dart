import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider.setCustomParameters({
        'client_id':
            '888388114814-icgbm24be14dq0u3rr7vpcejq6d78u2n.apps.googleusercontent.com'
      });
      print('sign in with google is excuted');

      await FirebaseAuth.instance.signInWithPopup(googleProvider);

      print('$googleProvider');

      return _auth.currentUser;
    } catch (e) {
      print("Google sign-in error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
