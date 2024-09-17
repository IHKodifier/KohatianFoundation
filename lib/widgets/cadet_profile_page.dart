import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CadetProfilePage extends ConsumerStatefulWidget {
  const CadetProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __CadetProfilePageState();
}

class __CadetProfilePageState extends ConsumerState<CadetProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          ProfileBannerSliver(),
          ProfileBodySliver(),
          SliverToBoxAdapter(child: SiteFooter()),
          
        ],
      ),
    );
  }
}
