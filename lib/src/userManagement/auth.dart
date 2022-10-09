import 'package:firebase_auth/firebase_auth.dart';

//Models
import '../models/userModel.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //Create user object
  UserModel? _user(User user) {
    return user != null
        ? UserModel(uid: user.uid, isAnonymous: user.isAnonymous, email: user.email, username: user.displayName, photoUrl:user.photoURL)
        : null;
  }

  Future signInGuest() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return _user(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
