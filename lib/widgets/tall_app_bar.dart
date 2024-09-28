import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/flexible_banner.dart';
import 'package:kohatian_foundation/widgets/kf-logo.dart';

class TallAppBar extends ConsumerWidget {
  const TallAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxWidth = MediaQuery.of(context).size.width;

    return SliverAppBar(
      pinned: true,
      // floating: true,
      toolbarHeight: 80,
      expandedHeight:
          ResponsiveBreakpoints.of(context).largerThan(MOBILE) ? 580 : 400,
      stretch: true,
      automaticallyImplyLeading: false,

      title: const NavBar(),

      flexibleSpace: const FlexibleBanner(),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> navBarItems = [
      const SizedBox(width: 24),
      //Logo
      const FoundationLogo(),
      //Vision
      TextButton(
          child: Container(
            color: Theme.of(context).colorScheme.onInverseSurface,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Vision',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          onPressed: () {
            showDialog(context: context, builder:(context) => AlertDialog(
                content: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  CachedNetworkImage(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvEdR5W2eXboMtBC49GW9PqLft_QXoCamNFQ&s')
                    ],
                  ),
                ),
                actions: [Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      child: Text('OK I Understand'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                )],
              ),);
          },
          ),
      //Mission
      TextButton(
          child: Container(
            color: Theme.of(context).colorScheme.onInverseSurface,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Mission',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
            onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   CachedNetworkImage(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvEdR5W2eXboMtBC49GW9PqLft_QXoCamNFQ&s')
                  ],
                ),
              ),
              actions: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      child: Text('OK I Understand'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      //Function
      TextButton(
          child: Container(
            color: Theme.of(context).colorScheme.onInverseSurface,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Function',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
            onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    CachedNetworkImage(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvEdR5W2eXboMtBC49GW9PqLft_QXoCamNFQ&s')
                  ],
                ),
              ),
              actions: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      child: Text('OK I Understand'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      //Pearls
      TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PearlsPage(),
          ));
        },
        child: Container(
          color: Theme.of(context).colorScheme.onInverseSurface,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Pearls of CCK',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ),
    ];

    return ResponsiveBreakpoints.of(context).largerThan(MOBILE)
        ? desktopAppBar(context, navBarItems)
        : mobileAppBar(context, navBarItems);
  }

  mobileAppBar(BuildContext context, List<Widget> navBarItems) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      // height: 80,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5), // Set the background color
        borderRadius: BorderRadius.circular(40), // Add rounded corners
      ),
      child: PopupMenuButton(
        elevation: 15,
        offset: Offset(-10, 40),
        child: const Icon(Icons.menu),
        itemBuilder: (context) {
          // navBarItems.removeAt(0);

          var _list = navBarItems
              .map((e) => PopupMenuItem(
                    value: e,
                    child: e,
                  ))
              .toList();
          _list.add(PopupMenuItem(
              child: UserAvatarWidget(flexDirection: Axis.horizontal)));
          return _list;
        },
      ),
    );
  }

  desktopAppBar(
    BuildContext context,
    List<Widget> navBarItems,
  ) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5), // Set the background color
          borderRadius: BorderRadius.circular(40), // Add rounded corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...navBarItems,
            UserAvatarWidget(
              flexDirection: Axis.vertical,
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
