import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class EntryCreationNotifier extends StateNotifier<EntryCreationState> {
  EntryCreationNotifier() : super(const EntryCreationState.initial());

  // Define the controllers here
  final _entryNameController = TextEditingController();
  final _entryNumberController = TextEditingController();
  final _entryStrengthController = TextEditingController();
  final _entryTitleController = TextEditingController();
  final _entrySloganController = TextEditingController();


  // Getters for the controllers
  TextEditingController get entryNameController => _entryNameController;
  TextEditingController get entryNumberController => _entryNumberController;
  TextEditingController get entryStrengthController => _entryStrengthController;
  TextEditingController get entryTitleController => _entryTitleController;
  TextEditingController get entrySloganController => _entrySloganController;


  // Date variables
  DateTime? _startDate;
  DateTime? _endDate;

  // Getters /setters  for the dates
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
    state = state.copyWith(startDate: value); // Update the state directly
  }
DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
    state = state.copyWith(endDate: value); // Update the state directly
  }

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
    state = state.copyWith(entry: entry);
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



  Future<void> saveEntry() async {
    // Access controllers from providers
    final entryName = _entryNameController.text;
    final entryNumber = _entryNumberController.text;
    final entryStrength = _entryStrengthController.text;
    final entryTitle = _entryTitleController.text;
    final entrySlogan = _entrySloganController.text;

    // Create the Entry object
    Entry newEntry = Entry(
      name: entryName,
      number: entryNumber,
      strength: int.tryParse(entryStrength) ?? 0,
      startDate: _startDate != null
          ? Timestamp.fromDate(_startDate!)
          : Timestamp.now(),
      endDate:
          _endDate != null ? Timestamp.fromDate(_endDate!) : Timestamp.now(),
      title: entryTitle,
      slogan: entrySlogan,
    );

    // Save the Entry to Firestore
    await DbService().saveEntryToFirestore(newEntry);

    // Update the notifier state with the newly created entry
    state = EntryCreationState.success(newEntry);
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
  final DateTime? startDate;
  final DateTime? endDate;
  final EntryCreationStatus status;

  EntryCreationState({
    this.entry,
    this.startDate,
    this.endDate,
    required this.status,
  });

  const EntryCreationState.initial()
      : entry = null,
        startDate = null,
        endDate = null,
        status = EntryCreationStatus.initial;

  const EntryCreationState.success(this.entry)
      : startDate = null,
        endDate = null,
        status = EntryCreationStatus.success;
  const EntryCreationState.failure()
      : entry = null,
        startDate = null,
        endDate = null,
        status = EntryCreationStatus.failure;

  EntryCreationState copyWith({
    Entry? entry,
    DateTime? startDate,
    DateTime? endDate,
    EntryCreationStatus? status,
  }) {
    return EntryCreationState(
      entry: entry ?? this.entry,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
    );
  }
}

enum EntryCreationStatus { initial, success, failure }
