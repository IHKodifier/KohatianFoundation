// ignore_for_file: dead_code. this can be removed later

import 'package:kohatian_foundation/widget_export.dart';

class StartUp extends ConsumerWidget {
  const StartUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
   
    final userAsyncValue = ref.watch(userProfileProvider);

     return userAsyncValue.when(
      data: (user) {
        // Check if user is not null before navigating
        if (user != null) {
          return UserHomePage();
        } else {
          return PublicHomePage();
        }
      },
      error: (error, stackTrace) =>
          Center(child: SelectableText('Errorrrrrrr: $error\n$stackTrace')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
