import 'package:kohatian_foundation/widget_export.dart';

class UserHome extends ConsumerWidget {
   UserHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: Scaffold(
      body: CustomScrollView(
        slivers: _slivers,
      ),
    ));
  }

  final _slivers = [
    const SliverToBoxAdapter(
      child: Stack(
        children: [
          // BannerImage(),
          UserFeedWidget(),
          AppBarWidget(),
        ],
      ),
    ),
    const SliverToBoxAdapter(
      child: SiteFooter(),
    )
  ];
}
