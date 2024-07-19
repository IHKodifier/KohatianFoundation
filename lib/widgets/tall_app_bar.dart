import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class TallAppBar extends ConsumerWidget {
  const TallAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  SliverAppBar(
      // pinned: true,
      floating: true,
      toolbarHeight: 100,
      expandedHeight: 700,
      stretch: true,
      automaticallyImplyLeading: false, 

      title: const NavBarRow(),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          const BannerImage(),
          Positioned(
            top:350, 
            left:300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Once a Kohatian is  \nAlways a Kohatian', 
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 96,
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
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Image.asset(
                'assets/images/kf-logo.png',
                width: 200,
                height: 80,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
            ),
          ),
          TextButton(
              child: const Text(
                'Vision',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {}),
          TextButton(
              child: const Text(
                'Mission',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {}),
          TextButton(
              child: const Text(
                'Function',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {}),
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
          const UserAvatarWidget(),
        ],
      ),
    ));
  }
}
