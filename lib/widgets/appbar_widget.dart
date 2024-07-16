import 'package:flutter/material.dart';
import 'package:kohatian_foundation/perals.dart';
import 'package:kohatian_foundation/widget_export.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      // pinned: true,
      floating: true,
      toolbarHeight: 120, 
      expandedHeight: 400,
      stretch: true,
    
      title: navBarRow(),
      flexibleSpace: FlexibleSpaceBar(
        background: BannerImage(), // BannerImage as the background
      ),
    );
  }
}

class navBarRow extends StatelessWidget {
  const navBarRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
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
                    .push(MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ),
          TextButton(child: const Text('Vision'), onPressed: () {}),
          TextButton(child: const Text('Mission'), onPressed: () {}),
          TextButton(child: const Text('Function'), onPressed: () {}),
          TextButton(
            child: const Text('Pearls of CCK'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PearlsPage(),
              ));
            },
          ),
          UserPicker(),
        ],
      )),
    );
  }
}
