import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class EditCadetProfilePage extends ConsumerWidget {

  const EditCadetProfilePage({ super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProfileBannerSliver(),
          ProfileBodyEditorSliver(),
          SliverToBoxAdapter(child: SiteFooter()),
        ],
      ),
    );
  }
}
