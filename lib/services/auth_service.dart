import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  Future<UserCredential?> signupWithGoogle() async {
    UserCredential? authResult = null;

    final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
    try {
      authResult =
          await FirebaseAuth.instance.signInWithPopup(googleAuthProvider);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        if (kDebugMode) {
          print('The account already exists with a different credential');
        }
      } else if (e.code == 'invalid-credential') {
        if (kDebugMode) {
          print('Invalid credential');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('error encountered in SignupWithGoogle $e');
      }
    }
    return authResult;
  }

  Future<bool> createAppUser({
    required UserCredential userCredential,
    required String name,
    required String kitno,
    required String house,
    required String domicile,
    required String mobileNumber,
  }) async {
    final result = await FirebaseFirestore.instance.collection('users').add({
      'uuid': userCredential.user!.uid,
      'name': name,
      'kitno': kitno,
      'house': house,
      'domicile': domicile,
      'mobileNumber': mobileNumber,
      'email': userCredential.user!.email,
      'isValidated': false,
      'roles': ['cadet']
    });

    if (kDebugMode) {
      print('Fireuser created with uuid ${userCredential.user!.uid}');

      print('appuser created with DocRef ${result.id}');
    }

    return result == null;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();  
  }
}
