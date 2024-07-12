import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:kohatian_foundation/services/widget_export.dart';

class AuthenticatedFirebaseUser {
  final User? user;

  AuthenticatedFirebaseUser({this.user});
}

class loggedInUserNotifier extends StateNotifier<AppUser?> {
  loggedInUserNotifier() : super(null);

  void updateAuthState(User? user) async {
    if (user != null) {
      try {
        final appUserDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (appUserDoc.exists) {
          final appUser = AppUser.fromMap(appUserDoc.data()!);
          state = appUser;
        } else {
          // Handle case where AppUser document doesn't exist
          if (kDebugMode) {
            print('AppUser document not found for user: ${user.uid}');
          } else if (user == null) {
            state = null;
          }
        }
      } catch (e) {
        // Handle errors during fetching AppUser
        if (kDebugMode) {
          print('Error fetching AppUser: $e');
        }
      }
    }
  }

  void signOutUser() {
    state = null;
    ;
  }
}


// Provider for the currently logged-in user
final loggedInUserProvider =
    StateNotifierProvider<loggedInUserNotifier, AppUser?>((ref) {
  final auth = FirebaseAuth.instance;
  final authUserNotifier = loggedInUserNotifier();

  // Check for logged-in user at app startup
  if (auth.currentUser != null) {
    authUserNotifier.updateAuthState(auth.currentUser);
  }
  // Listen to auth state changes
  auth.authStateChanges().listen((user) {
    authUserNotifier.updateAuthState(user);
  });

  return authUserNotifier;
});

// StateNotifier for current AppUser
class CurrentAppuserNotifier extends StateNotifier<AppUser?> {
  CurrentAppuserNotifier() : super(null);

  Future<void> updateAppuser(User? user) async {
    if (user != null) {
      try {
        final appUserDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (appUserDoc.exists) {
          final appUser = AppUser.fromMap(appUserDoc.data()!);
          state = appUser;
        } else {
          // Handle case where AppUser document doesn't exist
          if (kDebugMode) {
            print('AppUser document not found for user: ${user.uid}');
          }
        }
      } catch (e) {
        // Handle errors during fetching AppUser
        if (kDebugMode) {
          print('Error fetching AppUser: $e');
        }
      }
    } else {
      state = null;
    }
  }
}

class AuthService {
  Future<UserCredential?> signupWithGoogle() async {
    UserCredential? authResult;

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

  Future<AppUser?> createAppUser({
    required UserCredential userCredential,
    required String name,
    required String kitno,
    required String house,
    required String domicile,
    required String mobileNumber,
  }) async {
    final id = userCredential.user!.uid;
    final docRef = FirebaseFirestore.instance.collection('users').doc(id);

    final result =
        await FirebaseFirestore.instance.collection('users').doc(id).set({
      'uuid': userCredential.user!.uid,
      'name': name,
      'kitno': kitno,
      'house': house,
      'domicile': domicile,
      'mobileNumber': mobileNumber,
      'email': userCredential.user!.email,
      'isValidated': false,
      'roles': [UserRole.cadet().toMap()]
    });

    if (kDebugMode) {
      print('Fireuser created with uuid ${userCredential.user!.uid}');

      print('appuser created with DocRef $id');
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        return AppUser.fromMap(snapshot.data()!);
      } else {
        return null; // Or handle the case where the document doesn't exist
      }
    });
  }

  Future<void> signOut() async {
    final loggedInUserNotifier _authUserNotifier;
    await FirebaseAuth.instance.signOut();
    // final authUserNotifier=
    if (kDebugMode) {
      print('you hasve been signed out');
    }
  }
}
