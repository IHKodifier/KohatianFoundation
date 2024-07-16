import 'package:kohatian_foundation/widget_export.dart';

final authServiceProvider = FutureProvider<AuthService>((ref) async {
  final googleSignIn = await ref.watch(googleSignInProvider);
  return AuthService(googleSignIn: googleSignIn);
});


final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId:
        '239392991522-arev04me39i54824423japuftoon0goc.apps.googleusercontent.com',
  );
});
class AuthService  extends ChangeNotifier{
   final GoogleSignIn googleSignIn;

  AuthService({required this.googleSignIn});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: [
  //     'email',
  //     'profile'
  //   ],
  //   clientId: '239392991522-arev04me39i54824423japuftoon0goc.apps.googleusercontent.com'
  // );

  Future<UserCredential> signupWithGoogle() async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithPopup(
        GoogleAuthProvider(),
      );
    } on FirebaseException catch (e) {
      print(e);
      userCredential = null;
    } catch (e) {
      print(e);
      userCredential = null;
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

  bool hasLoggedInUser = FirebaseAuth.instance.currentUser != null;

  Future<void> createAppUserInDb(UserProfile appUser) async {
    // Create a new user document in Firestore
    final firebaseInstance = FirebaseFirestore.instance;

    try {
      await firebaseInstance
          .collection('users')
          .doc(appUser.uuid)
          .set(appUser.toMap());
      print('AppUser created successfully');
    } on FirebaseException catch (e) {
      // Handle Firebase errors
      print('Firebase error: $e');
      rethrow; // or handle the error differently based on your needs
    } catch (e) {
      // Handle unexpected errors
      print('Unexpected error: $e');
      rethrow; // or handle the error differently based on your needs
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
