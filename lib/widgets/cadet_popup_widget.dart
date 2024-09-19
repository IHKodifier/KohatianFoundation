import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CadetPopupWidget extends StatelessWidget {
  final Cadet cadet;
  final double maxWidth;

  CadetPopupWidget({super.key, required this.cadet, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    // Calculate a reasonable size for the popup based on constraints
    final popupWidth = maxWidth * 0.8; // 80% of parent

    return Center(
        child: Card(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              buildBannerImage(popupWidth),
              Positioned(
                top: 50,
                left: (popupWidth / 2) - 50,
                right: (popupWidth / 2) - 50,
                child: CircleAvatar(
                  // radius: 72,
                  minRadius: 52,
                  maxRadius: 52,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: cadet.profileImageUrl ??
                          'https://picsum.photos/300/300',
                      fadeInDuration: Durations.medium4,
                      fadeInCurve: Curves.easeInCirc,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(cadet.name),
          ),
        ],
      ),
    ));
  }

  Widget buildBannerImage(double popupWidth) {
    return SizedBox(
      width: popupWidth * .8,
      height: 100,
      child: CachedNetworkImage(
        imageUrl: cadet.bannerImageUrl ??
            'https://cbx-prod.b-cdn.net/COLOURBOX52709581.jpg?width=800&height=800&quality=70',
        fit: BoxFit.fitWidth,
        height: 100,
      ),
    );
  }
}
