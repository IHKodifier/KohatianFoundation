import 'package:kohatian_foundation/widget_export.dart';

class UserHomePage extends ConsumerWidget {
  UserHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           const AppBarWidget(), 
          SliverFillRemaining(
            
            child: Column(
              children: [
                // Add your content here
              
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: const Center(
                      child: Text('User Home Content goes here'),
                    ),
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
