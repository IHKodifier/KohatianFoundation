import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/signup_form.dart';

class SignupCenter extends ConsumerStatefulWidget {
  const SignupCenter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpCenterState();
}

class _SignUpCenterState extends ConsumerState<SignupCenter> {
  bool showSignUpForm = false;

  @override
  Widget build(BuildContext context) {
    var signInForm = SignInForm();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //App Bar
          const SliverToBoxAdapter(child: AppBarWidget()),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 920,
              child: SingleChildScrollView(
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
                              icon: const FaIcon(
                                Icons.person_2_rounded,
                                size: 40,
                              ),
                              onPressed: () => setState(() {
                                showSignUpForm = false;
                              }),
                            ),
                            const SizedBox(width: 40),
                            //Sign Out Button
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: ElevatedButton.icon(
                                label: const Text('Sign Out'),
                                icon: const Icon(
                                  Icons.person_2_rounded,
                                  size: 40,
                                ),
                                onPressed: () async {
                                 try {
                                    await 
                                        AuthService()
                                        .signOut();
                                    print('Signing out ');
                                    // You might want to navigate back to the login screen
                                    // or handle the sign-out in a different way
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PublicHome(),
                                      ),
                                      (route) => false,
                                    );
                                  } catch (e) {
                                    print('Error signing out: $e');
                                    // Handle the error appropriately
                                  }
                                },
                              ),
                            ),
                          ]),
                    ),

                    // Sign In / Sign Up Form
                    (showSignUpForm)
                        ? const SizedBox(
                            // height: 250,
                            width: 300,
                            // color: Colors.red,
                            child: Card(
                              elevation: 15,
                              child: SignupForm(),
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
          ),
          const SliverToBoxAdapter(
            child: SiteFooter(),
          )
        ],
      ),
    );
  }
}
