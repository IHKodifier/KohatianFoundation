

import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SiteFooter extends ConsumerWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        color: Theme.of(context).dividerColor,
        // height: 200,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kfFooterHeader(context),
                    SizedBox(height: 20,),
                    nonPolitical(),
                  
                  
                  
                  ],
                ),
              
              usefulLinks(context),
              
              ],
            ),
           
          
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text('Site Footer goes here'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding usefulLinks(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('UseFul Links',
                  style:Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: 20),
                ],
              ),
            );
  }

  Text kfFooterHeader(BuildContext context) {
    return Text('Kohatians Foundation',
                  style: Theme.of(context).textTheme.headlineMedium,);
  }

  SizedBox nonPolitical() {
    return SizedBox(
                    width: 600,
                    child: Text('''Kohatians Foundation is a NON POLITICAL, NON-PARTISAN, NON-SECTARIAN organization meant to serve the humanity irrespective of colour, caste, religion, sect, ethnicity, geographical or any other characteristic. Kohatians Foundation is meant to be a social welfare organization covering activities benefiting all segments of the population in selected areas.
                  
                     Kohatians Foundation is and shall be totally non­political in character. It shall have no political affiliations with any political party and shall not indulge in politics.'''),
                  );
  }
}