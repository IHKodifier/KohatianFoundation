import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class FlexibleBanner extends ConsumerWidget {
  const FlexibleBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxWidth = MediaQuery.of(context).size.width;
    return FlexibleSpaceBar(
      background: Stack(children: [
        const BannerImage(),
        Positioned(
          top: ResponsiveBreakpoints.of(context).largerThan(MOBILE) ? 350 : 250,
          left: maxWidth / 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Once a Kohatian is  \nAlways a Kohatian',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize:
                            ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                                ? 96
                                : 42,
                      )),
            ],
          ),
        ),
      ]), // BannerImage as the background
    );
  }
}
