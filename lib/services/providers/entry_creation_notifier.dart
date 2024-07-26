import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kohatian_foundation/models/entry_model.dart';

class EntryCreationNotifier extends StateNotifier<EntryCreationState> {
  EntryCreationNotifier() : super(const EntryCreationState.initial());

  // Define the controllers here
  final _entryNameController = TextEditingController();
  final _entryNumberController = TextEditingController();
  final _entryStrengthController = TextEditingController();
  final _entryTitleController = TextEditingController();
  final _entrySloganController = TextEditingController();
  final _entryStartDateController = TextEditingController();
  final _entryEndDateController = TextEditingController();

  // Getters for the controllers
  TextEditingController get entryNameController => _entryNameController;
  TextEditingController get entryNumberController => _entryNumberController;
  TextEditingController get entryStrengthController => _entryStrengthController;
  TextEditingController get entryTitleController => _entryTitleController;
  TextEditingController get entrySloganController => _entrySloganController;
  TextEditingController get entryStartDateController =>
      _entryStartDateController;
  TextEditingController get entryEndDateController => _entryEndDateController;



  Future<void> createEntry(Entry entry) async {
    
    //TODO
    // Simulate entry creation (replace with your actual logic)
    await Future.delayed(const Duration(seconds: 1));
    state = EntryCreationState.success(entry);
  }

  void reset() {
    state = const EntryCreationState.initial();
  }
  void success(Entry newEntry) {
    state = EntryCreationState.success(newEntry);
  }

}

class EntryCreationState {
  final Entry? entry;
  final EntryCreationStatus status;

  const EntryCreationState.initial()
      : entry = null,
        status = EntryCreationStatus.initial;

  const EntryCreationState.success(this.entry)
      : status = EntryCreationStatus.success;
  const EntryCreationState.failure()
      : entry = null,
        status = EntryCreationStatus.failure;
}

enum EntryCreationStatus { initial, success, failure }
