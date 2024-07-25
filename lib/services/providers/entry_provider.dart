import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kohatian_foundation/models/entry_model.dart';
import 'package:kohatian_foundation/widget_export.dart';

final entryProvider =
    StateNotifierProvider<EntryProviderNotifier, Entry>((ref) {
  return EntryProviderNotifier(
      initialEntry:
          Entry(name: 'no Entry is selected', number: '00', strength: 1,
          startDate: Timestamp.now(),
           endDate: Timestamp.now()));
});

class EntryProviderNotifier extends StateNotifier<Entry> {
  EntryProviderNotifier({required Entry initialEntry}) : super(initialEntry);

  void updateEntry({required Entry newEntry}) {
    state = newEntry;
    
  }
}
