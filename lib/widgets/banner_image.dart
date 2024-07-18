import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BannerImage extends ConsumerWidget {
  const BannerImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        width: double.infinity,
        // height: 500,
        // color: Colors.deepOrange,
        child: Image.asset('/images/banner_image.jpg',
        width: double.infinity,
        height: 800,
        fit: BoxFit.cover,
        ),),
    );
  }
}
