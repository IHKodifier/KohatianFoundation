import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SignUpSucess extends ConsumerWidget {
  const SignUpSucess({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        const TallAppBar(),
        //TODO  update UI,
        SliverToBoxAdapter(
            child: Card(
                child: Column(
          children: [
            Text(
              'You have signed up successfully',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Your entry Coordinator will verify the details and let you into the fraternity',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 12),
            Text(
                'You will also receive an email once the details are verified',
                style: Theme.of(context).textTheme.titleLarge,
                ),
            SizedBox(height: 12),
          ],
        ))),
        // SliverToBoxAdapter(child: Text('user name  is ${user} and email is ${email}')),
        SliverToBoxAdapter(child: SiteFooter()),
      ],
    );
  }
}
