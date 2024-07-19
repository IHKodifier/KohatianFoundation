import 'package:flutter/material.dart';
import 'package:kohatian_foundation/pages/sign-in_page.dart';
import 'package:kohatian_foundation/widget_export.dart';

class UserAvatarOverlayChild extends ConsumerStatefulWidget {
  const UserAvatarOverlayChild({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserAvatarOverlayChildState();
}

class _UserAvatarOverlayChildState extends ConsumerState<UserAvatarOverlayChild>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 450),
      vsync: this,
      // animationBehavior: AnimationBehavior.preserve
    );
    // Modified line:
    _animation = Tween<double>(begin: 200, end: 300).animate(CurvedAnimation(
      parent: _animationController,
      // parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(userProfileProvider);

    return Positioned(
      top: 50,
      right: 120,
      child: profile.when(
        data: (data) => AnimatedBuilder(
          animation: _animation,
          // duration: Durations.medium1,
          builder: (context, child) => SizedBox(
            // Modified lines:
            width: _animation.value *
                1.5, // Directly use animation value for width
            // height: _animation.value, // Directly use animation value for height
            child: child,
          ),
          child: Card(
            elevation: 5,
            color: Colors.white,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                profilePic(),
                Text(
                    'Cadet ID: ${data!.kitNo}'), // Display Kit Number as Cadet ID
                Text('Name: ${data.name}'), // Display Name
                Text('House: ${data.house}'), // Display House
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Card(
                    color: Colors.blueGrey.shade50,
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.person, size: 40),

                      title: Text('Account '),
                      subtitle: Text('${data.email}'),
                      // enabled: true,
                      trailing: TextButton(
                        onPressed: () {
                          //TODO
                             // Sign out the user
                          FirebaseAuth.instance.signOut();

                           Navigator.of(context).push( MaterialPageRoute(builder: (context) => const SignInPage()));
                         
                        },
                        child: Text(
                          'SIGN OUT',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Card(
                    color: Colors.blueGrey.shade50,
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.person, size: 40),

                      title: Text('Account  Type'),
                      subtitle: Row(
                        children: 
                          profile.asData!.value!.roles.map(
                            (e) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                borderRadius: BorderRadius.circular(12),
                                  
                                ),
                                
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Text(e.value),
                                )), 
                            ),
                          ).toList(),
                        
                      ),
                      // enabled: true,
                      trailing: 
                         (data.roles
                    .contains(UserRole.admin()))? // Check for Admin Role
                      TextButton(
                        onPressed: () {
                          //TODO
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  AdminCenterPage(),
                          ));
                        },
                        child: Text(
                          'Admin Center',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    // color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ):Container(),
                    ),
                  ),
                ),

                // if (data.roles
                //     .contains(UserRole.admin())) // Check for Admin Role
                //   TextButton.icon(
                //     onPressed: () {},
                //     label: const Text('Admin Center'),
                //     iconAlignment: IconAlignment.end,
                //     icon: const Icon(Icons.launch),
                //   ),
                SizedBox(height: 10),
              ],
            )),
          ),
        ),
        error: (error, stackTrace) =>
            Text(error.toString() + stackTrace.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Padding profilePic() {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: CircleAvatar(
        radius: 58,
        backgroundColor: Color.fromARGB(255, 4, 45, 92),
        backgroundImage: NetworkImage(
            'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200'),
      ),
    );
  }
}