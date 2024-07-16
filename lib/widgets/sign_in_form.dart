import 'package:kohatian_foundation/widget_export.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = ref.watch(authServiceProvider);
    final userProfile = ref.watch(userProfileProvider);

    return userProfile.when(
      data: (userProfile) {
        if (userProfile != null) {
          // Navigate to UserHome if userProfile is not null
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserHome(),));
        }
        return Form(
          key: _formKey,
          child: SizedBox(
            width: 300,
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
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _signInWithEmailAndPassword();
                      }
                    },
                    child: const Text('Sign In with Email/Password'),
                  ),

                  // Sign In with Google button
                  ElevatedButton(
                    // onPressed: null,
                    onPressed: () {
                      ref.read(authServiceProvider).signInWithGoogle();
                    },
                    child: const Text('Sign In with Google'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => CircularProgressIndicator(),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    final authService = ref.read(authServiceProvider);
    //   try {
    //     // await authService.signInWithEmailAndPassword(
    //     //   email: _emailController.text.trim(),
    //     //   password: _passwordController.text.trim(),
    //     // );
    //     // Update userProfileProvider and other providers as needed
    //     ref.read(userProfileProvider.notifier).update((state) => state);
    //   } on FirebaseAuthException catch (e) {
    //     // Handle sign-in errors (e.g., display an error message)
    //     print('Error signing in: ${e.code}');
    //   }
    // }

    Future<void> _signInWithGoogle() async {
      final authService = ref.read(authServiceProvider);
      // try {
      //   // await authService.signInWithGoogle();
      //   // Update userProfileProvider and other providers as needed
      //   ref.read(userProfileProvider.notifier).update((state) => state);
      // } catch (e) {
      //   // Handle sign-in errors (e.g., display an error message)
      //   print('Error signing in with Google: $e');
      // }
    }
  }
}
