import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SliverAppBar(
      // pinned: true,
      floating: true,
      toolbarHeight: 120, 
      expandedHeight: 400,
      stretch: true,
      automaticallyImplyLeading: false,
    
      title: NavBarRow(),
      flexibleSpace: FlexibleSpaceBar(
        background: BannerImage(), // BannerImage as the background
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
          // color: Colors.black.withOpacity(0.4),
          width: double.infinity,
          height: 80,
          child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // runSpacing: 10,
                  // spacing: 40,
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const MyApp()));
              },
            ),
          ),
          TextButton(child: const Text('Vision',
          style: TextStyle(color: Colors.white),
          ), onPressed: () {}),
          TextButton(child: const Text('Mission',style: TextStyle(color: Colors.white),), onPressed: () {}),
          TextButton(child: const Text('Function',
          style: TextStyle(color: Colors.white),
          ), onPressed: () {}),
          TextButton(
         
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  PearlsPage(),
              ));
            },
            child: const Text('Pearls of CCK',
               style: const TextStyle(color: Colors.white),
            ),
          ),
          const UserAvatarWidget(),
                  ],
                ),
        ));
  }
}
