import 'package:kohatian_foundation/widget_export.dart';

class PublicHome extends ConsumerWidget {
  const PublicHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
     
            
          ),
          SliverFillRemaining(child: Container(color:Colors.blue,
          child: Center(child: Text('Public home')),),),
          SliverToBoxAdapter(
            child: SiteFooter(),
          )
        ],
      ),
    );
  }
}
