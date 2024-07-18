import 'package:kohatian_foundation/pages/sign-in_page.dart';
import 'package:kohatian_foundation/widget_export.dart';

class UserAvatarWidget extends ConsumerStatefulWidget {
  const UserAvatarWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserAvatarWidgetState();
}

class _UserAvatarWidgetState extends ConsumerState<UserAvatarWidget> {
  OverlayPortalController _controller = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    final hasLoggedInUser = ref.watch(authServiceProvider).hasLoggedInUser;
    final profile = ref.watch(userProfileProvider);
    return !hasLoggedInUser
        ? showSignInUpButtons(context)
        : OverlayPortal(
            controller: _controller,
            child: MouseRegion(
              // cursor,
              onHover: (event) {
                _controller.toggle();
                print('showing overlay');
              },
              // onExit: (event) {
              //   _controller.hide();
              //   print('showing overlay');
              // },
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200'),
              ),
            ),
            overlayChildBuilder: (context) => Positioned(
                  top: 50,
                  right: 120,
                  child: AnimatedContainer(
                    duration: Durations.long4,
                    height: 250,
                    width: 250,
                    child: profile.when(
                      data: (data) => 
                       Card(
                        elevation: 15,
                        color: Colors.white,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(data!.kitNo),
                            Text(data!.name),
                            Text(data!.house),
                            data.roles.contains(UserRole.admin())? 
                           
                                TextButton.icon(onPressed: (){}, label: Text('Admin center'),
                                icon: FaIcon(FontAwesomeIcons.airbnb),)
                               
                            :Container(),
                          ],
                        )),
                      ),
                      error: (error, stackTrace) => Text(error.toString()+ stackTrace.toString()),
                      loading: () => const Center(child: CircularProgressIndicator()),  
                    ),
                  ),
                ));
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
