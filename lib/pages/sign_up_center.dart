import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget-export.dart';

class SignupCenter extends ConsumerStatefulWidget {
  const SignupCenter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpCenterState();
}

class _SignUpCenterState extends ConsumerState<SignupCenter> {
  bool showSignUpForm = false;

  @override
  Widget build(BuildContext context) {
    var signInForm = Container(
      // color: Colors.blue,
      height: 250,
      width: 500,
      // color: Colors.blue,
      child: Card(
        elevation: 15,
        child: Text('Sign In Form'),
      ),
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //App Bar
          SliverToBoxAdapter(child: AppBarWidget()),

          SliverToBoxAdapter(
            child: Container(
              height: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    //Sign In/Sign Out Buttons
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Sign In Button
                          ElevatedButton.icon(
                            label:
                                const Text('Sign In for Kohatian Foundation'),
                            icon: const Icon(
                              Icons.person_2_rounded,
                              size: 50,
                            ),
                            onPressed: () => setState(() {
                              showSignUpForm = false;
                            }),
                          ),
                          SizedBox(width: 40),
                          //Sign Out Button
                          ElevatedButton.icon(
                            label: const Text('Sign Out'),
                            icon: const Icon(Icons.person_2_rounded),
                            onPressed: () => print('Sign out'),
                          ),
                        ]),
                  ),
                  // Sign In / Sign Up Form
                  (showSignUpForm)
                      ? Container(
                          height: 250,
                          width: 500,
                          // color: Colors.red,
                          child: Card(
                            elevation: 15,
                            child: Text('Sign Up Form'),
                          ),
                        )
                      : signInForm,

                  //Sign Up Button
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ElevatedButton.icon(
                      label: const Text('Sign Up for Kohatian Foundation'),
                      icon: const Icon(Icons.person_add_alt_1_rounded),
                      onPressed: () => setState(() {
                        showSignUpForm = true;
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SiteFooter(),
          )
        ],
      ),
    );
  }
}
