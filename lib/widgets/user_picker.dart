import 'package:kohatian_foundation/widget_export.dart';

class UserPicker extends ConsumerWidget {
  const UserPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => navigatetoSignupCenter(context),
      icon: CircleAvatar(
        child: Icon(Icons.person_2_rounded),
      ),
    );
  }

  void navigatetoSignupCenter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  SignupCenter()),
    );
  }
}
