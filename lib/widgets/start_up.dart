// ignore_for_file: dead_code. this can be removed later

import 'package:kohatian_foundation/widget_export.dart';

class StartUp extends ConsumerWidget {
  const StartUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
    // Use ref.watch to access the AsyncValue from userProfileProvider
    final userAsyncValue = ref.watch(userProfileProvider);

    return userAsyncValue.when(
      data: (user) => user != null ? UserHome() : PublicHome(),
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const Center(child: CircularProgressIndicator()));
  }
}
