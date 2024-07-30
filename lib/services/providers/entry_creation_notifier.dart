import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kohatian_foundation/models/entry_model.dart';
import 'package:kohatian_foundation/widget_export.dart';

class EntryCreationNotifier extends StateNotifier<EntryCreationState> {
  EntryCreationNotifier() : super(const EntryCreationState.initial());

  // Define the controllers here
  final _entryNameController = TextEditingController();
  final _entryNumberController = TextEditingController();
  final _entryStrengthController = TextEditingController();
  final _entryTitleController = TextEditingController();
  final _entrySloganController = TextEditingController();
  // final _entryStartDateController = TextEditingController();
  // final _entryEndDateController = TextEditingController();

  // Getters for the controllers
  TextEditingController get entryNameController => _entryNameController;
  TextEditingController get entryNumberController => _entryNumberController;
  TextEditingController get entryStrengthController => _entryStrengthController;
  TextEditingController get entryTitleController => _entryTitleController;
  TextEditingController get entrySloganController => _entrySloganController;
  // TextEditingController get entryStartDateController =>
  //     _entryStartDateController;
  // TextEditingController get entryEndDateController => _entryEndDateController;

  // Date variables
  DateTime? _startDate;
  DateTime? _endDate;

  // Getters for the dates
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;

// Update methods for the dates
  void updateStartDate(DateTime? newDate) {
    // Create a new Entry object if it doesn't exist
    final entry = state.entry ??
        Entry(
          name: '',
          number: '',
          strength: 0,
          startDate: Timestamp.fromDate(newDate!),
          endDate: Timestamp.now(),
          title: '',
          slogan: '',
        );

    // Update the startDate of the Entry
    entry.startDate = Timestamp.fromDate(newDate!);

    // Update the state with the new Entry
    state = state!.copyWith(entry: entry);
  }

  void updateEndDate(DateTime? newDate) {
    // Create a new Entry object if it doesn't exist
   if (state.entry == null) {
      state = state.copyWith(
        entry: Entry(
          name: '',
          number: '',
          strength: 0,
          startDate: Timestamp.fromDate(newDate!),
          endDate: Timestamp.now(),
          title: '',
          slogan: '',
        ),
      );
    } else {
      // If the entry exists, update the startDate
      state = state.copyWith(
        entry: state.entry!.copyWith(startDate: Timestamp.fromDate(newDate!)),
      );
    }

   
  }



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

   EntryCreationState({
    this.entry,
    required this.status,
  });

  const EntryCreationState.initial()
      : entry = null,
        status = EntryCreationStatus.initial;
        

  const EntryCreationState.success(this.entry)
      : status = EntryCreationStatus.success;
  const EntryCreationState.failure()
      : entry = null,
        status = EntryCreationStatus.failure;
   EntryCreationState copyWith({Entry? entry, EntryCreationStatus? status}) {
    return EntryCreationState(
      entry: entry ?? this.entry,
      status: status ?? this.status,
    );
  }
}

enum EntryCreationStatus { initial, success, failure }
