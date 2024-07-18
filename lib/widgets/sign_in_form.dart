import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (FirebaseAuth.instance.currentUser != null) {}
    final authService = ref.watch(authServiceProvider);
    FirebaseAuth.instance.authStateChanges();
    if (currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('you are already logged in '),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => FirebaseAuth.instance.signOut,
            label: const Text('SignOut'),
            icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
          ),
       
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),  
          CachedNetworkImage(
            imageUrl:
                'https://cdni.iconscout.com/illustration/premium/thumb/user-login-7209363-5861790.png?f=webp',
            width: 300,
            height: 200,
          ),
          Text(
            'Sign In ',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                authService.hasLoggedInUser
                    ? const Text('You are already logged in')
                    : Container(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => PublicHomePage()));
                  },
                  child: const Text('Back to home'),
                ),
                authService.hasLoggedInUser
                    ? ElevatedButton(
                        onPressed: () {
                          ref.read(authServiceProvider).signOut();
                          // ref.read(userProfileProvider)
                        },
                        child: const Text('Sign Out'),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: SizedBox(
              width: 500,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Email field
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),

                    // Password field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),

                    // Sign In with Email/Password button
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _signInWithEmailAndPassword();
                            }
                          },
                          child: const Text('Sign In with Email'),
                        ),
                        ElevatedButton(
                          // onPressed: null,
                          onPressed: () async {
                            await ref
                                .read(authServiceProvider)
                                .signInWithGoogle();
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => UserHomePage(),
                            ));
                          },
                          child: const Text('Sign In with Google'),
                        ),
                      ],
                    ),

                    
                  ],
                ),
              ),
            ),
          ),
        // SiteFooter()
        ],
      );
    }
  }

  

  Future<void> _signInWithGoogle() async {
    ref.read(authServiceProvider);
    // try {
    //   // await authService.signInWithGoogle();
    //   // Update userProfileProvider and other providers as needed
    //   ref.read(userProfileProvider.notifier).update((state) => state);
    // } catch (e) {
    //   // Handle sign-in errors (e.g., display an error message)
    //   print('Error signing in with Google: $e');
    // }
  }

//TODO implement this
  Future<void> _signInWithEmailAndPassword() async {
    ref.read(authServiceProvider);
  
  }
}
