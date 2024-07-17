import 'package:kohatian_foundation/widget_export.dart';

class UserHomePage extends ConsumerWidget {
  UserHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    return authState.when(
      data: (User? user) {
        // User is logged in
        if (user != null) {
          final userProfile = ref.watch(userProfileProvider);
          return userProfile.when(
            data: (profile) {
              // User is logged in and profile data is available
              return Scaffold(
                // appBar: AppBarWidget(),
                body: UserFeedWidget(userId: user.uid),
                bottomNavigationBar: SiteFooter(),
              );
            },
            error: (error, stackTrace) => Text('Error: $error'),
            loading: () => Center(child: CircularProgressIndicator()),
          );
        } else
          return CircularProgressIndicator();
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
