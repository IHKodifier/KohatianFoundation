import 'package:kohatian_foundation/pages/sign-in_page.dart';
import 'package:kohatian_foundation/widget_export.dart';

class UserAvatarWidget extends ConsumerStatefulWidget {
  const UserAvatarWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserAvatarWidgetState();
}

class _UserAvatarWidgetState extends ConsumerState<UserAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    final hasLoggedInUser = ref.watch(authServiceProvider).hasLoggedInUser;

    return !hasLoggedInUser
        ? showSignInUpButtons(context)
        : showUserAvatar(context);
  }

  Widget showUserAvatar(context) {
    var controller = OverlayPortalController();
    return MouseRegion(
          onEnter: (event) => controller.show(),
          onExit: (event) => controller.hide(),
          child:const CircleAvatar(
         backgroundImage:NetworkImage(
        
           'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200') ,
          ));
      
    
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
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const SignInPage()));
            },
            child: const Text('Sign In')),
        const SizedBox(width: 10),
        ElevatedButton(
            onPressed: () {
              // navigateToSignUpScreen(context);
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
