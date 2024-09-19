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
    final popupWidth = maxWidth ; // 80% of parent

    return Center(
        child: Card(
          elevation: 150,
      child: Column(
        children: [
          _stack(popupWidth, context),
          const SizedBox(height:30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Text(cadet.name,
              style: Theme.of(context).textTheme.titleLarge,),
            ), 
          ),
               const SizedBox(height:12),
          Text(cadet.domicile),
               const SizedBox(height: 12),
          Text(cadet.mobileNumber),
          const SizedBox(height:12),
          const Text('Social '),
          const SizedBox(height:12),
          const Text('Social 2'),
          const SizedBox(height:12),
          const Text('Social 3'),
          const SizedBox(height:12),
       
        ],
      ),
    ));
  }

  Stack _stack(double popupWidth, BuildContext context) {
    return Stack(
          clipBehavior: Clip.none,
          children: [
            buildBannerImage(popupWidth),

            Positioned(
              top:38,
              left: (popupWidth / 2) - 50,
              right: (popupWidth / 2) - 50,
              child: CircleAvatar(
                radius: 38, 
               
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: cadet.profileImageUrl ??
                        'https://picsum.photos/300/300',
                    fadeInDuration: Durations.medium4,
                    fadeInCurve: Curves.easeInCirc,
                    // height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          ],
        );
  }

  Widget buildBannerImage(double popupWidth) {
    return SizedBox(
      width: popupWidth ,
      // height: 100,
      child: CachedNetworkImage(
        imageUrl: cadet.bannerImageUrl ??
            'https://cbx-prod.b-cdn.net/COLOURBOX52709581.jpg?width=800&height=800&quality=70',
        fit: BoxFit.cover,
        // height: 100,
      ),
    );
  }
}
