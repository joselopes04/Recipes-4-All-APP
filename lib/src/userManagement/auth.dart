import 'package:Recipes_app/src/pages/homePage.dart';
import 'package:Recipes_app/src/pages/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//Models
import '../models/userModel.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //Create user object
  UserModel? _user(User user) {
    return UserModel(
        uid: user.uid,
        isAnonymous: user.isAnonymous,
        email: user.email,
        username: user.displayName,
        photoUrl: user.photoURL);
  }

  //Check if a user is logged in or not
  void isLoggedIn(BuildContext context) {
    if(_firebaseAuth.currentUser == null){
      //if this don't have the delay it gives a random error, don't touch it, it works :)
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => WelcomePage()),
                (route) => false);
      });
    } else {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
      });
    }

    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     Navigator.pushNamed(context, 'welcome');
    //   } else {
    //     Navigator.pushNamed(context, 'home');
    //   }
    // });
  }

  //signInAnonymously
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

  //signInWithEmailAndPassword
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //Create user
  Future createUserWithEmailAndPassword({
    required String email,
    required String username,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = _firebaseAuth.currentUser;
    await user?.updateDisplayName(username);

    return _user(user!);
  }

  //ResetPassword
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  //Get current user
  Future getUser() async {
    return (await _firebaseAuth.currentUser);
  }

  //Get email
  String getEmail() {
    return (_firebaseAuth.currentUser?.email as String);
  }

  String getUsername()  {
    return (_firebaseAuth.currentUser?.displayName as String);
  }

  Future<void> signOut(BuildContext context) async {
    await _firebaseAuth.signOut();
    Navigator.pushNamed(context, '/');
  }
}
