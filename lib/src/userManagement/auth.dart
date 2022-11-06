import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_auth/firebase_auth.dart';

//External Packages
import 'package:fluttertoast/fluttertoast.dart';

//Styles
import '../styles/styles.dart';

//Models
import '../models/userModel.dart';

//Widgets
import '../widgets/alerts.dart';

//Pages
import 'package:Recipes_app/src/pages/homePage.dart';
import 'package:Recipes_app/src/pages/welcomePage.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /*AUTH*/
  //Create user object
  UserModel? _user(User user) {
    return UserModel(
        uid: user.uid,
        isAnonymous: user.isAnonymous,
        email: user.email,
        username: user.displayName,
        photoUrl: user.photoURL);
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

  Future<dynamic> reAuthenticateUser(context, email, password) async {
    AuthCredential credential = EmailAuthProvider.credential(
        email: email, password: password);
    try {
      await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(
          credential);
    } on FirebaseAuthException catch (e) {
      print("ERROR");
      print(e);
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "User not found",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: colorErrorRed,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1
        );
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Wrong Password",
            // message
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: colorErrorRed,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1
        );
      }
    }
  }

  Future<dynamic> signOut(BuildContext context) async {
    await _firebaseAuth.signOut();
    Navigator.pushNamed(context, '/');
  }

  /*GETTERS*/
  //Get current user
  Future getUser() async {
    return (await _firebaseAuth.currentUser);
  }

  //Get email
  String getEmail() {
    return (_firebaseAuth.currentUser?.email as String);
  }

  String getUsername() {
    return (_firebaseAuth.currentUser?.displayName as String);
  }

  /*OTHER OPERATIONS*/
  //ResetPassword
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  //Check if a user is logged in or not
  void isLoggedIn(BuildContext context) {
    if (_firebaseAuth.currentUser == null) {
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
  }

  Future<dynamic> updateUserInfo(context, name, email) async {
    await _firebaseAuth.currentUser?.updateDisplayName(name);
    try {
      await _firebaseAuth.currentUser?.updateEmail(email);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == "email-already-in-use") {
        Fluttertoast.showToast(
            msg: "This email is already in use",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: colorErrorRed,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1
        );
        return null;
      } else if (e.code == "requires-recent-login") {
        Fluttertoast.showToast(
            msg: "This operation needs recent authentication please do the login again.",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: colorErrorRed,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1
        );
        showReAuthentication(context);
      }
    }
  }
}
