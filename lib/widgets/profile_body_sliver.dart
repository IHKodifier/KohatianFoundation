import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class ProfileBodySliver extends ConsumerWidget {
  late double maxWidth;
   ProfileBodySliver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    maxWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
        child: Container(
      height: 300,
      width: 100,
      color: Colors.deepOrange,
      child: bodyCard(context, ref),
    ));
  }

  bodyCard(BuildContext context, WidgetRef ref) {
    return ResponsiveBreakpoints.of(context).isDesktop
        ? dekstopChild(context, ref)
        : ResponsiveBreakpoints.of(context).isTablet
            ? tabletChild(context, ref)
            : mobileChild(context, ref);
  }

  dekstopChild(BuildContext context, WidgetRef ref) {
    return Container(
        color: Colors.amber, child: const Center(child: Text('dekstop child')));
  }

  tabletChild(BuildContext context, WidgetRef ref) {
    return Container(
        color: Colors.green, child: const Center(child: Text('tablet child')));
  }

  mobileChild(BuildContext context, WidgetRef ref) {
    return Container(
        color: Colors.blue.shade200,
        child: const Center(child: Text('mobile child')));
  }
}
