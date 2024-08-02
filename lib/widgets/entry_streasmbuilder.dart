import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class EntryStreamBuilder extends ConsumerWidget {
  const EntryStreamBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryAsync = ref.watch(entryStreamProvider);

    return entryAsync.when(
        data: (data) => Container(
              height: 300,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue.shade400,
                    child: Text(data[index].number),
                  ),
                  title: Text(data[index].name),
                  subtitle: Text(
                    '${data[index].strength.toString()} cadets',
                  ),
                ),
              ),
            ),
        error: (error, stackTrace) =>
            Text(error.toString() + stackTrace.toString()),
        loading: () => Center(child: CircularProgressIndicator()));
  }
}
