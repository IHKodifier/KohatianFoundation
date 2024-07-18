import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SignUpSucess extends ConsumerWidget {
  const SignUpSucess({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return
         const CustomScrollView(
      slivers: [
        AppBarWidget(),
        //TODO  update UI,
        SliverToBoxAdapter(child: Text('Signupped Successfully')),
        // SliverToBoxAdapter(child: Text('user name  is ${user} and email is ${email}')),
        SliverToBoxAdapter(child: SiteFooter()),
      ],
    );
  }
}
