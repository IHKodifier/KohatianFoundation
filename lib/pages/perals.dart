import 'package:kohatian_foundation/services/widget-export.dart';

class PearlsPage extends ConsumerWidget {
  const PearlsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        //APPBAR
        const SliverToBoxAdapter(child: AppBarWidget()),

        EntryPicker(),

        //pearls header text
        SliverToBoxAdapter(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 50,
            child: Material(
              child: Center(
                child: Text(
                  'Pearls that CCK has produced over the years',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
            child:SiteFooter()),
      ],
    );
  }
}

class EntryPicker extends StatelessWidget {
  const EntryPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Material(
        child: DropdownMenu(
          width: 450,
          menuHeight: 500,
          leadingIcon: Icon(Icons.location_searching),
          enableFilter: true,
          dropdownMenuEntries: <DropdownMenuEntry<String>>[
            DropdownMenuEntry(label: 'First Entry', value: '1'),
            DropdownMenuEntry(label: 'Second Entry', value: '2'),
            DropdownMenuEntry(label: 'Third Entry', value: '3'),
          ],
          onSelected: (value) {},
        ),
      ),
    );
  }
}
