import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

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
          width: 150,
          height: 75,
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const MyApp()));
        },
      ),
    );
  }
}
