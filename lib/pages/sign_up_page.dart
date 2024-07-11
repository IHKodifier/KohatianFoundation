import 'package:kohatian_foundation/services/widget_export.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(child: AppBarWidget()),
        SignupForm(),
        SliverToBoxAdapter(
          child: SiteFooter(),
        ),
      ],
    );
    // child: Text('Sign In'),
  }
}
