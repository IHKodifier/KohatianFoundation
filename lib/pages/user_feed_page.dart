import 'package:kohatian_foundation/services/widget_export.dart';
import 'package:kohatian_foundation/widgets/user_feed.dart';

class UserFeedPage extends ConsumerWidget {
  const UserFeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: const Stack(
            children: [
              // BannerImage),
              UserFeedWidget(),
              AppBarWidget(),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SiteFooter(),
        )
      ],
    );
  }
}
