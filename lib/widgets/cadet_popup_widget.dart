import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:url_launcher/link.dart';

class CadetPopupWidget extends ConsumerWidget {
  final defaultBannerUrl = 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/cebd17f1-b283-45e5-8600-6ec3edc558fd/dee2aqv-222532a7-8676-4788-b8e3-08d4f5be55e2.png/v1/fill/w_1280,h_640,q_80,strp/profile_banner_by_darkfigure4_dee2aqv-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjQwIiwicGF0aCI6IlwvZlwvY2ViZDE3ZjEtYjI4My00NWU1LTg2MDAtNmVjM2VkYzU1OGZkXC9kZWUyYXF2LTIyMjUzMmE3LTg2NzYtNDc4OC1iOGUzLTA4ZDRmNWJlNTVlMi5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.sdy7FtZ92V4tHXX-hTf0PupZmkD7CQoG-BkmOY0_mQg';
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
