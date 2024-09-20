import 'package:flutter/material.dart';
import 'package:kohatian_foundation/pages/sign-in_page.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/user_avatar_overlay_child.dart';

class UserAvatarWidget extends ConsumerStatefulWidget {
  final   Axis flexDirection ;
   UserAvatarWidget({required this.flexDirection, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserAvatarWidgetState();
}

class _UserAvatarWidgetState extends ConsumerState<UserAvatarWidget> {
  Size startSize = const Size(100, 100);
  Size endSize = const Size(250, 250);

  final OverlayPortalController _controller = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    final hasLoggedInUser = ref.watch(authServiceProvider).hasLoggedInUser;
    final userId = ref.watch(authServiceProvider).getCurrentUser()?.email;
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

  

  Widget showSignInUpButtons(context) {
    return Flex(
      direction: widget.flexDirection,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
         SizedBox(
          height: widget.flexDirection == Axis.vertical ? 0 : 8,
          width: widget.flexDirection == Axis.horizontal ? 0 : 0,
          ),
        Expanded(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const SignInPage()));
              },
              child: const FittedBox(child: Text('Sign In'))),
        ),
       SizedBox(
          height: widget.flexDirection == Axis.vertical ? 8 : 0,
          width: widget.flexDirection == Axis.horizontal ? 8 : 0,
          ),
        Expanded(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const SignupPage()));
              },
              child: const FittedBox(child: Text('Sign Up'))),
        ),
       SizedBox(
          height: widget.flexDirection == Axis.vertical ? 8 : 0,
          width: widget.flexDirection == Axis.horizontal ? 8 : 0,
        ),
      ],
    );
  }
}
