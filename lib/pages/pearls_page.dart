import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widgets/entrry_picker.dart';
import 'package:kohatian_foundation/widget_export.dart';

class PearlsPage extends ConsumerWidget {
   PearlsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      return  Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(),
          SliverToBoxAdapter(
            child: Container(
              height: 450,
              child:  const Center(child:  UserAvatarWidget())),
          ), 
           const SliverToBoxAdapter(
            child: SiteFooter(),
          )
        ],
      ),
    );
  }
}