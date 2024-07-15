// ignore_for_file: dead_code. this can be removed later

import 'package:kohatian_foundation/widget_export.dart';

class StartUp extends ConsumerWidget {
  const StartUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
//check if the app has a logged in User
    bool hasLoggedInUser = AuthService().hasLoggedInUser; 

    return hasLoggedInUser ? UserHome() : PublicHome();
  }
}
