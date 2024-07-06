import 'package:kohatian_foundation/widget-export.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(child: AppBarWidget()),
        SignupForm(),
      ],
    );
    // child: Text('Sign In'),
  }
}
