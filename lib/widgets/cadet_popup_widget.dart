import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CadetPopupWidget extends StatelessWidget {
  final Cadet cadet;

  const CadetPopupWidget({super.key, required, required this.cadet});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;

        return Center(
      child: Card(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                    buildBannerImage(),
                    Positioned(
                      top: 50,
                      left: (maxWidth / 2) - 50,
                      right: (maxWidth / 2) - 50,
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
          ),
        );
      },
    );
  }

  CachedNetworkImage buildBannerImage() {
    return CachedNetworkImage(
      imageUrl: cadet.bannerImageUrl ??
          'https://cbx-prod.b-cdn.net/COLOURBOX52709581.jpg?width=800&height=800&quality=70',
      fit: BoxFit.fitWidth,
      height: 100,
    );
  }
}
