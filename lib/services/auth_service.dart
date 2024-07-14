import 'package:kohatian_foundation/widget_export.dart';

class AuthService {


  Future<UserCredential> signupWithGoogle() async {
    UserCredential? userCredential;
try {
        userCredential = await FirebaseAuth.instance.signInWithPopup(
      GoogleAuthProvider(),    );
} on FirebaseException  catch (e) {
 print(e);
  userCredential=null;
} catch (e) {
  print(e);
  userCredential=null;
}
 if (userCredential == null) {
    throw Exception('Failed to obtain user credentials');
  }

    return userCredential;
  }

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

Future<User?> getCurrentUser() async {
  return FirebaseAuth.instance.currentUser;
}
Future<void> createAppUserInDb(AppUser appUser) async {
  // Create a new user document in Firestore
  final firebaseInstance = FirebaseFirestore.instance;

  try {
      await firebaseInstance
          .collection('users').doc(appUser.uuid).set(appUser.toMap());
      print('AppUser created successfully');
    } 
    on FirebaseException catch (e) {
      // Handle Firebase errors
      print('Firebase error: $e');
      rethrow; // or handle the error differently based on your needs
    } catch (e) {
      // Handle unexpected errors
      print('Unexpected error: $e');
      rethrow; // or handle the error differently based on your needs
    }
}


}
  
