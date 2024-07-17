//Provider
// Provider for the AppUserNotifier
import 'package:kohatian_foundation/widget_export.dart';

// final appUserProvider = StateNotifierProvider<AppUserNotifier, UserProfile?>(
//     (ref) => AppUserNotifier());

// //AppUserNotifier
// class AppUserNotifier extends StateNotifier<UserProfile?> {
//   AppUserNotifier() : super(null) {
//     _init();
//   }
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> _init() async {
//     // Check for initial authenticated user
//     final user = _auth.currentUser;
//     if (user != null) {
//       await _fetchAndSetState(user);
//     }
//     // Listen for auth state changes
//     _auth.authStateChanges().listen((user) async {
//       if (user != null) {
//         await _fetchAndSetState(user);
//       } else {
//         state = null;
//       }
//     });
//   }
// void signOut() async {
//   await _auth.signOut();
//   state = null;
// }

//   Future<void> _fetchAndSetState(User user) async {
//     try {
//       final doc = await _firestore.collection('users').doc(user.uid).get();
//       if (doc.exists) {
//         state = UserProfile.fromMap(doc.data()!);
//       } else {
//         // Handle user not found in Firestore
//         // You might want to log an error or display an appropriate message
//         print('User not found in Firestore');
//       }
//     } catch (e) {
//       // Handle errors fetching user data
//       // You might want to log the error or display an appropriate error message
//       print('Error fetching user data: $e');
//     }
//   }
// }

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

// StreamProvider.family for real-time updates
final userProfileProvider = StreamProvider<UserProfile?>((ref) {
  final authService = ref.watch(authServiceProvider);
  final user = authService.getCurrentUser();
  if (user != null) {
    final userId = user.uid;
    final docStream =
        ref.read(firestoreProvider).collection('users').doc(userId).snapshots();
    return docStream.map((docSnapshot) {
      if (docSnapshot.exists) {
        return UserProfile.fromMap(docSnapshot.data()!);
      } else {
        print('User not found in Firestore');
        return null;
      }
    });
  } else {
    throw Exception('User not found');
    return Stream<UserProfile?>.value(null);
  }
});
