import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SiteFooter extends ConsumerWidget {
  SiteFooter({super.key});
  double width = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        color: Theme.of(context).dividerColor,
        // height: 200,
        width: this.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              Expanded(flex:2, child:  col1(context)),
              Expanded(flex:1, child:  col2(context)),
              Expanded(flex:1, child:  col3(context)),
              // col2(context),
              // col3(context),
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
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Text kfFooterHeader(BuildContext context) {
    return Text(
      'Kohatians Foundation',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  SizedBox nonPolitical(BuildContext context) {
    return const SizedBox(
      width: 600,
      child: Text(
'''Kohatians Foundation is a NON POLITICAL, NON-PARTISAN, NON-SECTARIAN organization meant to serve the humanity irrespective of colour, caste, religion, sect, ethnicity, geographical or any other characteristic. Kohatians Foundation is meant to be a social welfare organization covering activities benefiting all segments of the population in selected areas.
        
Kohatians Foundation is and shall be totally non­political in character. It shall have no political affiliations with any political party and shall not indulge in politics.'''),
    );
  }

  Widget fromTheNews(BuildContext context) {
    return Container(
      width: 250,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        ListTile(
          title: Text('General Body Meeting of tyhe Kophatians Foundation '),
          subtitle: Text('28 Jul 2021'),
        ),
        Divider(),
        ListTile(
          title: Text('Independent News Pakistan '),
          subtitle: Text('21 Jun 2020'),
        ),
        Divider(),
      ]),
    );
  }

  col1(context) {
    return Column(
      children: [
        kfFooterHeader(context),
        nonPolitical(context),
        // fromTheNews(context),
        // usefulLinks(context),)
      ],
    );
  }

  col2(context) {
    return Column(
      children: [
        usefulLinks(context),
      ],
    );
  }

  col3(context) {
    return Column(children: [
      fromTheNews(context),
    ],);
  }
}
