import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class EntryStreamBuilder extends ConsumerWidget {
  const EntryStreamBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryAsync = ref.watch(entryStreamProvider);

    return entryAsync.when(
        data: (data) =>  ListView.builder(
          shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) => entryListTile(data, index),
              ),
          
        error: (error, stackTrace) =>
            Text(error.toString() + stackTrace.toString()),
        loading: () => Center(child: CircularProgressIndicator()));
  }

  Widget entryListTile(List<Entry> data, int index) {
    return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue.shade400,
                  child: Text(data[index].number),
                ),
                title: Text(data[index].name),
                subtitle: Text(
                  '${data[index].strength.toString()} cadets',
                ),
              );
  }
}
