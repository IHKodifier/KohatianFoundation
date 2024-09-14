import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class TallAppBar extends ConsumerWidget {
  const TallAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxWidth = MediaQuery.of(context).size.width;

    return SliverAppBar(
      // pinned: true,
      floating: true,
      toolbarHeight: 100,
      expandedHeight: ResponsiveBreakpoints.of(context).largerThan(MOBILE)?700:400,
      stretch: true,
      automaticallyImplyLeading: false,

      title: 
          NavBarRow(),
         
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          const BannerImage(),
          Positioned(
            top: ResponsiveBreakpoints.of(context).largerThan(MOBILE)?350:250, 
            left: maxWidth/4, 
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Once a Kohatian is  \nAlways a Kohatian',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.onPrimary, 
                          fontSize: ResponsiveBreakpoints.of(context).largerThan(MOBILE)?96:42,
                        )),
              ],
            ),
          ),
        ]), // BannerImage as the background
      ),
    );
  }
}

class NavBarRow extends StatelessWidget {
  const NavBarRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> navBarItems = [
      //Vision
      Expanded(
        child: TextButton(
            child: const Text(
              'Vision',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {}),
      ),
      //Mission
      Expanded(
        child: TextButton(
            child: const Text(
              'Mission',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {}),
      ),
      //Function
      Expanded(
        child: TextButton(
            child: const Text(
              'Function',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {}),
      ),
      //Pearls
      TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PearlsPage(),
          ));
        },
        child: const Text(
          'Pearls of CCK',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ];

    return Center(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5), // Set the background color
        borderRadius: BorderRadius.circular(50), // Add rounded corners
      ),
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Kf logo
          ResponsiveBreakpoints.of(context).isMobile
              ? PopupMenuButton(
                  child: const Icon(Icons.menu),
                  itemBuilder: (context) => navBarItems
                      .map((e) => PopupMenuItem(
                            child: e,
                            value: e,
                          ))
                      .toList(),
                )
              : const FoundationLogo(),

          ResponsiveBreakpoints.of(context).isMobile
              ? const FoundationLogo()
              : const SizedBox.shrink(),
          ResponsiveBreakpoints.of(context).largerThan(MOBILE)
              ? Row(children: navBarItems)
              : Row(children: [SizedBox.shrink()]),
          //UserAvatar
          const Expanded(child: UserAvatarWidget()),
        ],
      ),
    ));
  }
}

class FoundationLogo extends StatelessWidget {
  const FoundationLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Image.asset(
          'assets/images/kf-logo.png',
          width: 200,
          height: 80,
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const MyApp()));
        },
      ),
    );
  }
}
