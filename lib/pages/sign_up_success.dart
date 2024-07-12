import 'package:kohatian_foundation/services/widget_export.dart';

class SignUpSuccess extends ConsumerWidget {
  const SignUpSuccess({super.key});

  @override
  @override
   Widget build(BuildContext context, WidgetRef ref) {
     final user = ref.watch(currentLoggedInUserProvider); 
   return Material(
      child: Container(
        color: Colors.purple,
        child: Center(
          child: user != null
              ? Column(
                  children: [
                    Text('welcome ${user.name} ${user.email} ${user.uuid}'),
                    ElevatedButton(
                        onPressed: () => AuthService().signOut(),
                        child: const Text('Log out')),
                  ],
                )
              : const CircularProgressIndicator(), // Show loading indicator while waiting for data
        ),
      ),
    );
  }
}

