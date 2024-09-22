import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class ProfileBannerSliver extends ConsumerWidget {
  const ProfileBannerSliver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cadet = ref.watch(currentCadetProvider);
    double maxWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Container(
        width: maxWidth - 16,
        // height: 600,
        padding: EdgeInsets.all(8),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            bannerImage(cadet),
            profileImage(cadet, context),
          ],
        ),
      ),
    );
  }

  Positioned profileImage(Cadet? cadet, context) => Positioned(
        bottom: -75,
        left: MediaQuery.of(context).size.width / 2 - 75,
        // right: MediaQuery.of(context).size.width / 2,
        child: CircleAvatar(
          // radius: 72,
          minRadius: 79,
          maxRadius: 79,
          backgroundColor: Theme.of(context).colorScheme.primary,

          child: Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    blurStyle: BlurStyle.normal,
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                    spreadRadius: 30,
                  ),
                ],
              ),
              child: ClipOval(
                child: Material(
                  elevation: 25,
                  child: CachedNetworkImage(
                    imageUrl: cadet?.profileImageUrl ??
                        'https://picsum.photos/300/300',
                    fadeInDuration: Durations.medium4,
                    fadeInCurve: Curves.easeInCirc,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  CachedNetworkImage bannerImage(Cadet? cadet) => CachedNetworkImage(
        imageUrl: cadet?.bannerImageUrl ??
            'https://cbx-prod.b-cdn.net/COLOURBOX52709581.jpg?width=800&height=800&quality=70',
        fit: BoxFit.cover,
        height: 400,
      );
}
