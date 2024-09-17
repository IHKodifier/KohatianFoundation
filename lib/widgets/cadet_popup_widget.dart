import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CadetPopupWidget extends StatelessWidget {

  final Cadet cadet;

  const CadetPopupWidget({Key? key, required , required this.cadet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            Stack(children: [
             CachedNetworkImage(imageUrl: cadet?.bannerImageUrl ?? 'https://cbx-prod.b-cdn.net/COLOURBOX52709581.jpg?width=800&height=800&quality=70',
  fit: BoxFit.cover,
  height: 200,  
   ),
   Positioned(
    bottom: -75,
    left:MediaQuery.of(context).size.width/2-75,
    // right: MediaQuery.of(context).size.width / 2,
    child: CircleAvatar( 
      // radius: 72, 
      minRadius: 79,
      maxRadius: 79,
      backgroundColor: Theme.of(context).colorScheme.surface,

      child: Center(
        child: CachedNetworkImage(imageUrl: 
        cadet?.profileImageUrl?? 'https://picsum.photos/300/300',
        fadeInDuration: Durations.medium4,
        fadeInCurve: Curves.easeInCirc,
        height: 150,
        fit: BoxFit.contain,
        
        ),
      ),
    ),
  )

            ],),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(cadet.name),
            ),
          ],
        ),
      ),
    );
  }
}
