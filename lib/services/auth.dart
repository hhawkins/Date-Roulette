import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class User {
  User({
    @required this.uid,
    this.photoUrl,
    this.displayName,
  });
  final String uid;
  final String photoUrl;
  final String displayName;
}

abstract class AuthBase {
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = auth.FirebaseAuth.instance;

  User _userFromFirebase(auth.User user) {
    if (user == null) {
      return null;
    }

    return User(
      uid: user.uid,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> signInWithGoogle() async {
    // final googleSignIn = GoogleSignIn();
    // final googleAccount = await googleSignIn.signIn();
    // if (googleAccount != null) {
    //   final googleAuth = await googleAccount.authentication;
    //   if (googleAuth.accessToken != null && googleAuth.idToken != null) {
    //     final authResult = await _firebaseAuth.signInWithCredential(
    //       auth.GoogleAuthProvider.getCredential(
    //         idToken: googleAuth.idToken,
    //         accessToken: googleAuth.accessToken,
    //       ),
    //     );
    //     return _userFromFirebase(authResult.user);
    //   } else {
    //     throw PlatformException(
    //       code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
    //       message: 'Missing Google Auth Token',
    //     );
    //   }
    // } else {
    //   throw PlatformException(
    //     code: 'ERROR_ABORTED_BY_USER',
    //     message: 'Sign in aborted by user',
    //   );
    // }
  }

  @override
  Future<User> signInWithFacebook() async {
    // final facebookLogin = FacebookLogin();
    // final result = await await facebookLogin.logIn(permissions: [
    //   FacebookPermission.publicProfile,
    //   FacebookPermission.email,
    // ]);
    // if (result.accessToken != null) {
    //   final authResult = await _firebaseAuth.signInWithCredential(
    //     auth.FacebookAuthProvider.credential(
    //       result.accessToken.token,
    //     ),
    //   );
    //   return _userFromFirebase(authResult.user);
    // } else {
    //   throw PlatformException(
    //     code: 'ERROR_ABORTED_BY_USER',
    //     message: 'Sign in aborted by user',
    //   );
    // }
  }

  @override
  Future<void> signOut() async {
    // final googleSignIn = GoogleSignIn();
    // await googleSignIn.signOut();
    // final facebookLogin = FacebookLogin();
    // await facebookLogin.logOut();
    await _firebaseAuth.signOut();
  }
}
