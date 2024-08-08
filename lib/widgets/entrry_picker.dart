import 'package:flutter/material.dart';
import 'package:kohatian_foundation/services/providers/cadet_stream_provider.dart';
import 'package:kohatian_foundation/widget_export.dart';

final selectedEntryProvider = StateProvider<String>((ref) => '');

// class PearlsPage extends ConsumerWidget {
//   const PearlsPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return CustomScrollView(
//       slivers: [
//         //APPBAR
//         const SliverToBoxAdapter(child: AppBarWidget()),

//         EntryPicker(),

//         //pearls header text
//         SliverToBoxAdapter(
//           child: SizedBox(
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height - 50,
//             child: Material(
//               child: Center(
//                 child: Text(
//                   'Pearls that CCK has produced over the years',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//               ),
//             ),
//           ),
//         ),

//         SliverToBoxAdapter(
//             child: SizedBox(
//           height: 200,
//           child: Container(
//             color: Colors.white,
//           ),
//         )),
//       ],
//     );
//   }
// }

// class EntryPicker extends StatelessWidget {
//   const EntryPicker({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: DropdownMenu(
//         width: 450,
//         menuHeight: 500,
//         leadingIcon: Icon(Icons.location_searching),
//         enableFilter: true,
//         dropdownMenuEntries: <DropdownMenuEntry<String>>[
//           DropdownMenuEntry(label: 'First Entry', value: '1'),
//           DropdownMenuEntry(label: 'Second Entry', value: '2'),
//           DropdownMenuEntry(label: 'Third Entry', value: '3'),
//         ],
//         onSelected: (value) {},
//       ),
//     );
//   }
// }

class EntryPicker extends ConsumerWidget {
  const EntryPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String selectedEntry = ref.watch(selectedEntryProvider);
    final entries = ref.watch(entryStreamProvider);

    return entries.when(
      data: (data) => DropdownMenu(
              width: 450,
//         menuHeight: 500,
leadingIcon: Icon(Icons.location_searching),
        enableFilter: true,
        // value: data.first.name, // Set initial value
        // hint: const Text('Select Entry'),
        dropdownMenuEntries:  data.map((entry) {
          return DropdownMenuEntry<String>(
            value: entry.name,
            label: entry.name,
          );
        }).toList(),
        onSelected: (value) {
          selectedEntry = value!;
          ref.read(selectedEntryProvider.notifier).state = selectedEntry;
        },
      ),
      error: (error, stackTrace) =>
          Text(error.toString() + stackTrace.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
