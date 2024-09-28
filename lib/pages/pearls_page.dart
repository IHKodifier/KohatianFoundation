import 'package:flutter/material.dart';
import './../services/providers/cadet_stream_provider.dart';

import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/entrry_picker.dart';

//  provider for the hover state
final hoverProvider = StateProvider<int?>((ref) => null);

class PearlsPage extends ConsumerWidget {
  late BuildContext _context;
  late WidgetRef _ref;
  PearlsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;
    final hoverIndex = ref.watch(hoverProvider);
    _context = context;
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text('Pearls that CCK has produced over the years',
                        style: Theme.of(context).textTheme.displaySmall),
                    SizedBox(
                      height: 24,
                    ),
                    const Center(child: EntryPicker()),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Card(
                            elevation: 5,
                            margin: const EdgeInsets.all(8),
                            child: ref.watch(selectedEntryProvider) != ''
                                ? cadetsAsync.when(
                                    data: onCadetGridData,
                                    error: (error, stackTrace) => Text(
                                        error.toString() +
                                            stackTrace.toString()),
                                    loading: () => const Center(
                                        child: CircularProgressIndicator()),
                                  )
                                : Container()),
                      ),
                    ),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: SiteFooter(),
          )
        ],
      ),
    );
  }

  Widget? onCadetGridData(List<Cadet> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ResponsiveBreakpoints.of(_context).largerThan(TABLET)
              ? 5
              : 2, // Adjust the number of columns as needed
          crossAxisSpacing: 24,
          mainAxisSpacing: 12,
          childAspectRatio: 1, // Adjust the aspect ratio as needed
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return MouseRegion(
                onEnter: (_) { _ref.read(hoverProvider.notifier).state = index;
                // get_socials
                },
                onExit: (_) => _ref.read(hoverProvider.notifier).state = null,
                child: CadetGridTile(
                  cadet: data[index],
                  index: index,
                  maxWidth:
                      constraints.maxWidth, // Pass maxWidth to CadetGridTile
                ),
              );
            },
          );
        },
      ),
    );
  }
} 


