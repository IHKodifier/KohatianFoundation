import 'package:kohatian_foundation/widget_export.dart';

class UserHome extends ConsumerWidget {
  UserHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           AppBarWidget(), // Use AppBarWidget directly
          SliverFillRemaining(
            // Add SliverFillRemaining
            child: Column(
              children: [
                // Add your content here
                Expanded(
                  child: Center(
                    child: Text('User Home Content goes here'),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SiteFooter(),
          )
        ],
      ),
    );
  }
}
