import 'package:kohatian_foundation/widget-export.dart';

class PublicHome extends ConsumerWidget {
  PublicHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: _slivers,
      ),
    );
  }

  final _slivers = [
    const SliverToBoxAdapter(
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
  ];
}
