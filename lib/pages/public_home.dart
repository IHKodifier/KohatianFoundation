import 'package:kohatian_foundation/widget_export.dart';

class PublicHome extends ConsumerWidget {
  PublicHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                BannerImage(),
                AppBarWidget(),
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
