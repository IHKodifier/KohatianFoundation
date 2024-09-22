import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  // final _formKey = GlobalKey<FormState>();
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();

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
      return Card(
        margin: const EdgeInsets.all(24),
        elevation: 50,
        child: Flex(
          direction: MediaQuery.of(context).size.width > 800
              ? Axis.horizontal
              :  Axis.vertical
                 ,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Sign In Art
            CachedNetworkImage(
              imageUrl:
                  'https://cdni.iconscout.com/illustration/premium/thumb/user-login-7209363-5861790.png?f=webp',
              width: 400,
              height: 300,
            ),
        
            // Sign In with Google button
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Login with Google',
                    style: Theme.of(context).textTheme.displaySmall),
                    SizedBox(height: 20,),
                Text('To Sign In to Kohatian Foundation, Login with your Google Account',
                    style: Theme.of(context).textTheme.titleSmall),
                    SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () async {
                    await ref.read(authServiceProvider).signInWithGoogle();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => UserHomePage(),
                    ));
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
        
            // Email sign-in functionality removed as requested
            // ... (rest of the email sign-in code removed)
          ],
        ),
      );
    }
  }

  

  // Future<void> _signInWithGoogle() async {
  //   ref.read(authServiceProvider);
  //   // try {
  //   //   // await authService.signInWithGoogle();
  //   //   // Update userProfileProvider and other providers as needed
  //   //   ref.read(userProfileProvider.notifier).update((state) => state);
  //   // } catch (e) {
  //   //   // Handle sign-in errors (e.g., display an error message)
  //   //   print('Error signing in with Google: $e');
  //   // }
  // }


}
