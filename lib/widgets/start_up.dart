// ignore_for_file: dead_code. this can be removed later



import 'package:kohatian_foundation/widget_export.dart';

class StartUp extends ConsumerWidget {
  const StartUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = FirebaseAuth.instance.authStateChanges();
    // final userId = -userStream.first.value.asData.value;

    return StreamBuilder<Tuple2<User?, UserProfile?>>(
      stream:
          Rx.combineLatest2<User?, UserProfile?, Tuple2<User?, UserProfile?>>(
      userStream,
        userStream.switchMap((user) {
          if (user != null) {
            final userId =
                user.uid; // Get the userId from the authenticated user
            // Access the Firestore document stream using the userId
            return ref
                .read(firestoreProvider)
                .collection('users')
                .doc(userId)
                .snapshots()
                .map((snapshot) {
              if (snapshot.exists) {
                return UserProfile.fromMap(snapshot.data()!);
              } else {
                return null;
              }
            });
          } else {
            return Stream<UserProfile?>.value(null);
          }
        }),
        (user, profile) => Tuple2(user, profile),
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data!.item1;
          final profile = snapshot.data!.item2;

          if (user != null && profile != null) {
            return UserHomePage();
          } else {
            return PublicHomePage();
          }
        } else if (snapshot.hasError) {
          return Center(child: SelectableText('Error: ${snapshot.error}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
