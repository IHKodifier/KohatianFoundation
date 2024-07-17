import 'package:kohatian_foundation/widget_export.dart';

class UserFeedWidget extends ConsumerWidget {
  const UserFeedWidget({required this.userId, super.key});
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(authStateChangesProvider);
    if (ref.read(authServiceProvider).getCurrentUser() != null) {
      final userProfileAsync = ref.watch(userProfileProvider);

      return userProfileAsync.when(
          data: onData,
          error: (error, stackTrace) =>
              Text(error.toString() + stackTrace.toString()),
          loading: () => Center(child: CircularProgressIndicator()));
    } else {
      return Center(child: Text('No user logged in'));
    }

    // return Material(
    //   child: Container(
    //     height: 800,
    //     color: Colors.yellow,
    //     child: userProfileAsync.when(
    //       data: (userProfile) {
    //         if (userProfile != null) {
    //           return Center(
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Text(
    //                   'Welcome Ex-cadet Mr ${userProfile.name}',
    //                   style: const TextStyle(fontSize: 20),
    //                 ),
    //                 Text(
    //                   'Your WhatsApp  ${userProfile.mobileNumber}',
    //                   style: const TextStyle(fontSize: 20),
    //                 ),
    //               ],
    //             ),
    //           );
    //         } else {
    //           // This else clause is unnecessary because we've already handled
    //           // the case of no logged-in user in the StartUp widget.
    //           // return const Center(
    //           //   child: Text('No user logged in'),
    //           // );
    //           return const SizedBox.shrink(); // Or any other widget you prefer
    //         }
    //       },
    //       error: (error, stackTrace) =>
    //           Center(child: SelectableText('Errorrrrrrr: $error\n$stackTrace')),
    //       loading: () => const Center(child: CircularProgressIndicator()),
    //     ),
    //   ),
    // );
  }

  Widget onData(UserProfile? data) {
    return Text('Welcome to your user Feed Mr ${data.toString()}');
  }
}
