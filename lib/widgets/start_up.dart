// ignore_for_file: dead_code

import 'package:kohatian_foundation/widget-export.dart';

class StartUp extends ConsumerWidget {
  const StartUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
//check if the app has a logged in User
    bool loggedInUser = false;

    return loggedInUser ? UserHome() : PublicHome();
  }
}
