import 'package:flutter/material.dart';
import 'package:kohatian_foundation/pages/perals.dart';
import 'package:kohatian_foundation/services/widget-export.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        height: 120,
        width: double.infinity,
        color: Colors.green,
        child: Center(
            child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 10,
          spacing: 150,
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
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
                }),
            IconButton(
              onPressed: () => navigatetoSignInPage(context),
              icon: CircleAvatar(
                child: Icon(Icons.person_2_rounded),
              ),
            ),
          ],
        )),
      ),
    );
  }

  void navigatetoSignInPage(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage(),));
  }
}
