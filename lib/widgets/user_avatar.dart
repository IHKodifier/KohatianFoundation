import 'package:flutter/material.dart';
import 'package:kohatian_foundation/pages/sign-in_page.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/user_avatar_overlay_child.dart';

class UserAvatarWidget extends ConsumerStatefulWidget {
  const UserAvatarWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserAvatarWidgetState();
}

class _UserAvatarWidgetState extends ConsumerState<UserAvatarWidget> {
   Size startSize = Size(50, 50);
  Size endSize = Size(250, 250);
 
  OverlayPortalController _controller = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    final hasLoggedInUser = ref.watch(authServiceProvider).hasLoggedInUser;
    final profile = ref.watch(userProfileProvider);
    return !hasLoggedInUser
        ? showSignInUpButtons(context)
        : OverlayPortal(
            controller: _controller,
            child: GestureDetector(
              onTap: () {
                _controller.toggle();
              },
              child: MouseRegion(
                
                cursor:SystemMouseCursors.click,
               
              
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200'),
                ),
              ),
            ),
            overlayChildBuilder: (context) => AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              // width: currentSize.width,
              // height: currentSize.height,
              
              child: UserAvatarOverlayChild()));
  }

  // Widget showUserAvatar(context) {
  //   return
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
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const SignupPage()));
            },
            child: const Text('Sign Up')),
      ],
    );
  }
}
