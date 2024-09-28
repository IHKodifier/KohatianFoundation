import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:url_launcher/link.dart';

class CadetPopupWidget extends ConsumerWidget {
  final defaultBannerUrl = 'https://picsum.photos/800/150?random =3';
  final Cadet cadet;
  final double maxWidth;

  CadetPopupWidget({super.key, required this.cadet, required this.maxWidth});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Calculate a reasonable size for the popup based on constraints
    final popupWidth = maxWidth; // 80% of parent

    return GestureDetector(
      onTap: () {
        ref.read(currentCadetProvider.notifier).setCurrentCadet(cadet);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CadetProfilePage(),
        ));
      },
      child: Center(
          child: Card(
        elevation: 150,
        child: Column(
          children: [
            _stack(popupWidth, context),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cadet.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 4),
            Text(cadet.domicile),
            const SizedBox(height: 4),
            // Text(cadet.mobileNumber),
            const SizedBox(height: 4),
            cadet.socialLinks!=null?
             Column(
              children: [

                Link(uri: Uri.parse(cadet.socialLinks!.linkedin!),
                target: LinkTarget.defaultTarget,
                builder: (context, followLink) => TextButton(onPressed: followLink, child: Text(cadet.socialLinks!.linkedin!)),),

                Link(uri: Uri.parse(cadet.socialLinks!.facebook!),
                target: LinkTarget.defaultTarget,
                builder: (context, followLink) => TextButton(onPressed: followLink, child: Text(cadet.socialLinks!.facebook!)),),

                Link(uri: Uri.parse(cadet.socialLinks!.instagram!),
                target: LinkTarget.defaultTarget,
                builder: (context, followLink) => TextButton(onPressed: followLink, child: Text(cadet.socialLinks!.instagram!)),),
                
           
              ],
            ):Container(),
             
            const SizedBox(height: 4),
          
            signupButton(context),
            const SizedBox(height: 8),
          ],
        ),
      )),
    );
  }

  Stack _stack(double popupWidth, BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        buildBannerImage(popupWidth),
        Positioned(
          top: 38,
          left: (popupWidth / 2) - 50,
          right: (popupWidth / 2) - 50,
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: Center(
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      cadet.profileImageUrl ?? 'https://picsum.photos/300/300',
                  fadeInDuration: Durations.medium4,
                  fadeInCurve: Curves.easeInCirc,
                  // height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildBannerImage(double popupWidth) {
    return SizedBox(
      width: popupWidth,
      // height: 100,
      child: CachedNetworkImage(
        imageUrl: cadet.bannerImageUrl ?? defaultBannerUrl,
        fit: BoxFit.cover,
        height: 80,
      ),
    );
  }

  signupButton(BuildContext context) {
    return cadet.hasSignedUp != true
        ? ElevatedButton(
            onPressed: () {
              // Navigate to SignupPage and pass the kitNo
              Navigator.pushNamed(context, '/signup',
                  arguments: cadet.kitNo.toString());
            },
            child: Text('Signup as ${cadet.kitNo.toString()}'))
        : Container();
  }
}
