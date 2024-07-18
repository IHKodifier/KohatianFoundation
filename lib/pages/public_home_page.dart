import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class PublicHomePage extends ConsumerWidget {
  const PublicHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return  const Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarWidget(),
          PublicHomeWidget(),
          SliverToBoxAdapter(
            child: SiteFooter(),
          )
        ],
      ),
    );
  }
}
