

import 'package:kohatian_foundation/widget_export.dart';



final authStateChangesProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

// StreamProvider.family for real-time updates
// final userProfileProvider = StreamProvider<UserProfile?>((ref) {
//   final authService = ref.watch(authServiceProvider);
//   final user = authService.getCurrentUser();
//   if (user != null) {
//     final userId = user.uid;
//     final docStream =
//         ref.read(firestoreProvider).collection('users').doc(userId).snapshots();
//     return docStream.map((docSnapshot) {
//       if (docSnapshot.exists) {
//         return UserProfile.fromMap(docSnapshot.data()!);
//       } else {
//         print('User not found in Firestore');
//         return null;
//       }
//     });
//   } else {
//     throw Exception('Userrr not found');
//     return Stream<UserProfile?>.value(null);
//   }
// });

final userProfileProvider =
    StreamProvider.family<UserProfile?, String>((ref, userId) {
  final firestore = ref.read(firestoreProvider);
  return firestore
      .collection('users')
      .doc(userId)
      .snapshots()
      .map((docSnapshot) {
    if (docSnapshot.exists) {
      return UserProfile.fromMap(docSnapshot.data()!);
    } else {
      print('User not found in Firestore');
      return null;
    }
  });
});
