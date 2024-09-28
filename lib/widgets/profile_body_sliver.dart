import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:url_launcher/link.dart';

class ProfileBodySliver extends ConsumerWidget {
  late double maxWidth;
  ProfileBodySliver({super.key});
  late Cadet cadet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    cadet = ref.watch(currentCadetProvider) as Cadet;
    maxWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
        child: Container(
      height: 800,
      width: 100,
      // color: Colors.deepOrange,
      child: bodyCard(context, ref),
    ));
  }

  bodyCard(BuildContext context, WidgetRef ref) {
    return ResponsiveBreakpoints.of(context).isDesktop
        ? dekstopChild(context, ref)
        : ResponsiveBreakpoints.of(context).isTablet
            ? tabletChild(context, ref)
            : mobileChild(context, ref);
  }

  dekstopChild(BuildContext context, WidgetRef ref) {
    return Container(
        // color: Colors.amber,
        child:  Center(
            child: Column(
          children: [
             const SizedBox(
              height: 84,
            ),
            Align(alignment: Alignment.center, child: name(context, ref)),
            house(context, ref),
            domicile(context, ref),
            cadet.socialLinks != null
                
                ? socialLinks(context, ref)
                : const SizedBox.shrink(),
                 cadet.professionalQualifications!.length > 0
            ? Qualifications(cadet: cadet)
            : const SizedBox.shrink(),
         
          ],
        )));
  }

  tabletChild(BuildContext context, WidgetRef ref) {
    return Container(
        // color: Colors.green,
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            Align(alignment: Alignment.center, child: name(context, ref)),
            house(context, ref),
            domicile(context, ref),
            cadet.socialLinks != null
                ? socialLinks(context, ref)
                : const SizedBox.shrink(),
                cadet.professionalQualifications!.length>0?
                Qualifications(cadet: cadet):const SizedBox.shrink(),
           
          ],
        )));
  }

  mobileChild(BuildContext context, WidgetRef ref) {
    return Container(
        // color: Colors.blue.shade200,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 44,
            ),
            Align(alignment: Alignment.center, child: name(context, ref)),
            house(context, ref),
            domicile(context, ref),
            // Container(
            //   width: 600,
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 5,
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) {
            //         return Card(
            //           elevation: 15,
            //           child: Container(
            //             height: 100,
            //             width: 100,
            //             decoration: BoxDecoration(boxShadow: [
            //               BoxShadow(
            //                   blurRadius: 50,
            //                   blurStyle: BlurStyle.outer,
            //                   spreadRadius: 10,
            //                   color: Theme.of(context).colorScheme.primary)
            //             ]),
            //             child: Center(
            //               child: Text('photos on File $index'),
            //             ),
            //           ),
            //         );
            //       },),
            // ),
            cadet.socialLinks != null
                ? socialLinks(context, ref)
                : const SizedBox.shrink(),
                cadet.professionalQualifications!.length > 0
            ? Qualifications(cadet: cadet)
            : const SizedBox.shrink(),
          ],
        )));
  }

  Widget name(BuildContext context, WidgetRef ref) {
    return FittedBox(
      child: Text(cadet.name, style: Theme.of(context).textTheme.displaySmall),
    );
  }

  house(BuildContext context, WidgetRef ref) {
    String houseName = cadet.house; // Start with the default value

    switch (cadet.house) {
      case 'JH':
        houseName = 'Jinnah House';
        break;
      case 'KH':
        houseName = 'Khushal House';
        break;
      case 'IH':
        houseName = 'Iqbal House';
        break;
      case 'AH':
        houseName = 'Ayub House';
        break;
      case 'MH':
        houseName = 'Munawar House';
        break;
      case 'RH':
        houseName = 'Rustam House';
        break;
      // default: // No need for a default case, as houseName is already initialized
      // houseName = cadet.house;
    }

    return FittedBox(
      child: Text(houseName, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  domicile(BuildContext context, WidgetRef ref) {
    return FittedBox(
      child:
          Text(cadet.domicile, style: Theme.of(context).textTheme.titleSmall),
    );
  }

  socialLinks(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        cadet.socialLinks!.linkedin!.isNotEmpty?
        Link(
          uri: Uri.parse(cadet.socialLinks!.linkedin!),
          target: LinkTarget.defaultTarget,
          builder: (context, followLink) => TextButton(
              onPressed: followLink, child: Text(cadet.socialLinks!.linkedin!)),
        ):const SizedBox.shrink(),
         cadet.socialLinks!.facebook!.isNotEmpty?
        Link(
          uri: Uri.parse(cadet.socialLinks!.facebook!),
          target: LinkTarget.defaultTarget,
          builder: (context, followLink) => TextButton(
              onPressed: followLink, child: Text(cadet.socialLinks!.facebook!)),
        ):const SizedBox.shrink(),
        cadet.socialLinks!.instagram!.isNotEmpty?
        Link(
          uri: Uri.parse(cadet.socialLinks!.instagram!),
          target: LinkTarget.defaultTarget,
          builder: (context, followLink) => TextButton(
              onPressed: followLink,
              child: Text(cadet.socialLinks!.instagram!)),
        ):const SizedBox.shrink(),
          cadet.socialLinks!.youtube!.isNotEmpty
            ? Link(
                uri: Uri.parse(cadet.socialLinks!.youtube!),
                target: LinkTarget.defaultTarget,
                builder: (context, followLink) => TextButton(
                    onPressed: followLink,
                    child: Text(cadet.socialLinks!.youtube!)),
              )
            : const SizedBox.shrink(),
            SizedBox.shrink(),
      ],
    );
  }
}
