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
  Size startSize = const Size(100, 100);
  Size endSize = const Size(250, 250);

  OverlayPortalController _controller = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    final hasLoggedInUser = ref.watch(authServiceProvider).hasLoggedInUser;
    final userId = ref.watch(authServiceProvider).getCurrentUser()?.uid;
    final profileStream = ref.watch(userProfileProvider(userId ?? ''));

    return !hasLoggedInUser
        ? showSignInUpButtons(context)
        : profileStream.when(
            // value: profile,
            data: (profile) => OverlayPortal(
              controller: _controller,
              child: GestureDetector(
                onTap: () {
                  _controller.toggle();
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: profile!.profileImageUrl.isNotEmpty
                        ? NetworkImage(profile.profileImageUrl)
                        : const AssetImage('assets/images_no_user_avatar'),
                  ),
                ),
              ),
              overlayChildBuilder: (context) => AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                child: const UserAvatarOverlayChild(),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          );
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
