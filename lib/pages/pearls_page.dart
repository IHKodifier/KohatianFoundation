import 'package:flutter/material.dart';
import './../services/providers/cadet_stream_provider.dart';

import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/entrry_picker.dart';

class PearlsPage extends ConsumerWidget {
  PearlsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final selectedEntry = ref.watch(selectedEntryProvider);
    final cadetsAsync = ref.watch(cadetStreamProvider(selectedEntry));
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
                    const Center(child: EntryPicker()),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Card(
                          elevation: 5,
                          margin: const EdgeInsets.all(8),
                          child:ref.watch(selectedEntryProvider)!=''?
                          cadetsAsync.when(
                            data: onCadetGridData,
                              error: (error, stackTrace) => Text(
                                    error.toString() + stackTrace.toString()),
                             loading: () => const Center(
                                  child: CircularProgressIndicator()),
                             ):Container()
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

  Widget? onCadetGridData(List<Cadet> data) {
    return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  4, // Adjust the number of columns as needed
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 4,
                              childAspectRatio:
                                  0.95, // Adjust the aspect ratio as needed
                            ),
                            itemCount:  data.length,
                             
                            itemBuilder: (context, index) {
                              return 
                                    CadetGridTile(cadet: data[index]);
                               
                            },
                          );
  }
}
