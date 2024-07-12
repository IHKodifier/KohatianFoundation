import 'package:kohatian_foundation/services/widget_export.dart';

class SignUpSuccess extends ConsumerWidget {
  const SignUpSuccess({super.key});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loggedInUserProvider);
    return Material(
      child: Container(
        color: Colors.purple,
        child: Center(
          child: user != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('welcome ${user.name}'),
                    Text('welcome ${user.email}'),
                    ElevatedButton(
                        onPressed: () {
                          ref.read(loggedInUserProvider.notifier).signOutUser();
                        },
                        child: const Text('Log out')),
                  ],
                )
              : const CircularProgressIndicator(), // Show loading indicator while waiting for data
        ),
      ),
    );
  }
}
