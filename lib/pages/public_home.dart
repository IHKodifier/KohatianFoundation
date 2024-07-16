import 'package:kohatian_foundation/widget_export.dart';

class PublicHome extends ConsumerWidget {
  const PublicHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            // ... other SliverAppBar properties
            // flexibleSpace: FlexibleSpaceBar(
            //   background: BannerImage(),
            // ),
            
          ),
          SliverFillRemaining(child: Container(color:Colors.blue),),
          SliverToBoxAdapter(
            child: SiteFooter(),
          )
        ],
      ),
    );
  }
}
