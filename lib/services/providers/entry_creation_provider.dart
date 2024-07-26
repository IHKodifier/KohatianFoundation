import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

final entryCreationProvider =
    StateNotifierProvider<EntryCreationNotifier, EntryCreationState>(
  (ref) => EntryCreationNotifier(),
);

final entryNameControllerProvider = Provider<TextEditingController>((ref) {
  return ref.watch(entryCreationProvider.notifier).entryNameController;
});

final entryNumberControllerProvider = Provider<TextEditingController>((ref) {
  return ref.watch(entryCreationProvider.notifier).entryNumberController;
});

final entryStrengthControllerProvider = Provider<TextEditingController>((ref) {
  return ref.watch(entryCreationProvider.notifier).entryStrengthController;
});

final entryTitleControllerProvider = Provider<TextEditingController>((ref) {
  return ref.watch(entryCreationProvider.notifier).entryTitleController;
});

final entrySloganControllerProvider = Provider<TextEditingController>((ref) {
  return ref.watch(entryCreationProvider.notifier).entrySloganController;
});


// });
final entryStartDateProvider = StateProvider<DateTime?>((ref) => null);
final entryEndDateProvider = StateProvider<DateTime?>((ref) => null);
