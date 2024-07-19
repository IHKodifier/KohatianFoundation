import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SlimAppBar extends ConsumerWidget {
  const SlimAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     return const SliverAppBar(
      
     
      floating: true,

      automaticallyImplyLeading: false,
     
      title: Padding(child: NavBarRow(),
      padding: EdgeInsets.all(8),
      ),
    
     
         );
  }
}
