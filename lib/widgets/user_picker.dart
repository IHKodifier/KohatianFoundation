import 'package:kohatian_foundation/pages/sign-in_page.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/start_up.dart';

class UserPicker extends ConsumerWidget {
  const UserPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasLoggedInUser = ref.watch(authServiceProvider).hasLoggedInUser;

    return !hasLoggedInUser
        ? showSignInUpButtons(context)
        : showUserAvatar(context);
  }

  IconButton showUserAvatar(context) {
    return IconButton(
      // onPressed: () => navigatetoSignupCenter(context),
      onPressed: () {
        print('user avatar clicked');
        print('user  will be signed out');

        FirebaseAuth.instance.signOut();
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInPage()),

          // Remove all routes below
        );
      },
      icon: const CircleAvatar(
        child: Icon(Icons.person_2_rounded),
      ),
    );
  }

  // void navigatetoSignupCenter(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => const Scaffold(
  //               body: Text('Irfan Malik'),
  //             )),
  //   );
  // }

  Widget showSignInUpButtons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              navigateToSignInScreen(context);
            },
            child: const Text('Sign In')),
            SizedBox(width: 10),
        ElevatedButton(
            onPressed: () {
              navigateToSignUpScreen(context);
            },
            child: const Text('Sign Up')),
      ],
    );
  }

  void navigateToSignInScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  }

  void navigateToSignUpScreen(context) {
     Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
  }
}
