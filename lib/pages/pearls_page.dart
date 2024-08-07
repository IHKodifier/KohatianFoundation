import 'package:flutter/material.dart';
import './../services/providers/cadet_stream_provider.dart';

import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/entrry_picker.dart';

class PearlsPage extends ConsumerWidget {
  PearlsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cadets = ref.watch(cadetStreamProvider('29th entry'));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const TallAppBar(),
          SliverToBoxAdapter(
            child: Container(
                height: 850,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Center(child: const EntryPicker()),
                    Flexible(
                    
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Card(
                          elevation: 5,
                          margin: EdgeInsets.all(8),
                          child: GridView.extent(
                            maxCrossAxisExtent: 300, 
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 16,
                            children: cadets.when(
                              data: (data) => data.map((cadet) => CadetGridTile(cadet: cadet)).toList(), 
                              error: (error, stackTrace) => [Text(error.toString()+ stackTrace.toString())] , 
                              loading: () => [Center(child: CircularProgressIndicator())],),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          const SliverToBoxAdapter(
            child: SiteFooter(),
          )
        ],
      ),
    );
  }
}
