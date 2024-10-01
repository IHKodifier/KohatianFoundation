import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class ProfileBodyEditorSliver extends ConsumerWidget {
  late Cadet original;
  ProfileBodyEditorSliver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    original = ref.watch(currentCadetProvider) as Cadet;
    final modified = original.copyWith();

    return SliverToBoxAdapter(
      child: Container(
        height: 800,
        width: 100,
        color: Colors.deepOrange,
        child: bodyCard(context, ref),
      ),
    );
  }

  bodyCard(BuildContext context, WidgetRef ref) {
    return ResponsiveBreakpoints.of(context).isDesktop
        ? dekstopChild(context, ref)
        : ResponsiveBreakpoints.of(context).isTablet
            ? tabletChild(context, ref)
            : mobileChild(context, ref);
  }

  dekstopChild(BuildContext context, WidgetRef ref) {
    return Text('Editing ${original.name}');
  }

  tabletChild(BuildContext context, WidgetRef ref) {}

  mobileChild(BuildContext context, WidgetRef ref) {}
}
