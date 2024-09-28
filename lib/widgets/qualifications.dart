import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class Qualifications extends ConsumerWidget {
  final Cadet cadet;
  double maxWidth=0;
  Qualifications({required this.cadet, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: builder);
  }

  Widget builder(BuildContext context, BoxConstraints constraints) {
    maxWidth = constraints.maxWidth;
    return Container(
     height: 350,
      width: maxWidth,
      child: Card(
        elevation:3,
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('After the college, studied... ',
              style:Theme.of(context).textTheme.titleLarge),
            ), 
           ...cadet.professionalQualifications?.map((e) => 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${e.title} at ${e.institution} (${e.year})'),
        ),
      ).toList() ?? [],
            
          ],
        ),
        ),
      ),
    );
  }
}
