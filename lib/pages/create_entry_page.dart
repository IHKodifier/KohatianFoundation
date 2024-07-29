import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CreateEntryPage extends ConsumerStatefulWidget {
  const CreateEntryPage({super.key});

  @override
  ConsumerState<CreateEntryPage> createState() => _CreateEntryPageState();
}

class _CreateEntryPageState extends ConsumerState<CreateEntryPage> {
  final GlobalKey<FormState> formKeyEntryDetails = GlobalKey<FormState>();

  bool formIsBusy = false;
  late Widget form;

  @override
  Widget build(BuildContext context) {
    final savedEntry = ref.watch(entryCreationProvider).;

    // Use a ternary operator to handle the initial null state
    form = savedEntry == null
        ? Form(
            key: formKeyEntryDetails,
            child: Column(
              children: [
                //Entry Name
                TextFormField(
                  controller: ref.read(entryNameControllerProvider),
                  decoration: const InputDecoration(
                    labelText: 'Entry Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter entry name';
                    }
                    return null;
                  },
                ),

                // Entry Number
                TextFormField(
                  controller: ref.read(entryNumberControllerProvider),
                  decoration: const InputDecoration(
                    labelText: 'Entry Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter entry number';
                    }
                    return null;
                  },
                ),

                // Entry Strength
                TextFormField(
                  controller: ref.read(entryStrengthControllerProvider),
                  decoration: const InputDecoration(
                    labelText: 'Entry Strength',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter entry strength';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Start Date

                // Entry Title
                TextFormField(
                  controller: ref.read(entryTitleControllerProvider),
                  decoration: const InputDecoration(
                    labelText: 'Entry Title (Optional)',
                  ),
                  // validator: (value) {
                  //   return null;
                  // },
                ),

                // Entry Slogan
                TextFormField(
                  controller: ref.read(entrySloganControllerProvider),
                  decoration: const InputDecoration(
                    labelText: 'Entry Slogan (Optional)',
                  ),
                  //  validator: (value) {
                  //   return null;
                  // },
                ),
              ],
            ),
          )
        : Center(
            child:
                Text('newe entry of ${savedEntry.name} created successfully'),
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Entry'),
        centerTitle: true,
      ),
      body: !formIsBusy
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    savedEntry!=null?
                    buildEntryDetailsSection(savedEntry):Container(),
                    buildcreatedEntrySummary(savedEntry),
                    const SizedBox(height: 16),
                     savedEntry!=null?
                     buildDatePickerRow():Container(),
                    buildSaveButton(),
                    buildDropzoneAndCreateCadetsButton(),
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildEntryDetailsSection(Entry? savedEntry) {
    //show when ready to create new entry

    return formIsBusy
        ? const Center(child: CircularProgressIndicator())
        : savedEntry == null
            ? form
            : buildcreatedEntrySummary(savedEntry);
  }

  Widget buildDatePickerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: ref.watch(entryStartDateProvider) ?? DateTime.now(),
              firstDate: DateTime(1965),
              lastDate: DateTime.now(),
            ).then((date) {
              if (date != null) {
                ref.read(entryStartDateProvider.notifier).state = date;
              }
            });
          },
          child: Text(
            ref.watch(entryStartDateProvider) != null
                ? '${ref.watch(entryStartDateProvider)!.toLocal().day} - ${ref.watch(entryStartDateProvider)!.toLocal().month} - ${ref.watch(entryStartDateProvider)!.toLocal().year}'
                : 'Select Start Date',
          ),
        ),
        // End Date
        ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: ref.watch(entryEndDateProvider) ?? DateTime.now(),
              firstDate: DateTime(1970),
              lastDate: DateTime.now(),
            ).then((date) {
              if (date != null) {
                ref.read(entryEndDateProvider.notifier).state = date;
              }
            });
          },
          child: Text(
            ref.watch(entryEndDateProvider) != null
                ? '${ref.watch(entryEndDateProvider)!.toLocal().day} - ${ref.watch(entryEndDateProvider)!.toLocal().month} - ${ref.watch(entryEndDateProvider)!.toLocal().year}'
                : 'Select End Date',
          ),
        ),
      ],
    );
  }

  Widget buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          if (formKeyEntryDetails.currentState!.validate()) {
            // Access controllers from providers
            final entryName = ref.read(entryNameControllerProvider).text;
            final entryNumber = ref.read(entryNumberControllerProvider).text;
            final entryStrength =
                ref.read(entryStrengthControllerProvider).text;
            final selectedStartDate = ref.read(entryStartDateProvider);
            final selectedEndDate = ref.read(entryEndDateProvider);
            final entryTitle = ref.read(entryTitleControllerProvider).text;
            final entrySlogan = ref.read(entrySloganControllerProvider).text;

            // Create the Entry object
            Entry newEntry = Entry(
              name: entryName,
              number: entryNumber,
              strength: int.tryParse(entryStrength) ?? 0,
              startDate: selectedStartDate != null
                  ? Timestamp.fromDate(selectedStartDate)
                  : Timestamp.now(),
              endDate: selectedEndDate != null
                  ? Timestamp.fromDate(selectedEndDate)
                  : Timestamp.now(),
              title: entryTitle ?? 'not applicable',
              slogan: entrySlogan ?? 'not applicable',
            );

            // Save the Entry to Firestore
            setState(() {
              formIsBusy = true;
            });
            await DbService().saveEntryToFirestore(newEntry);
            setState(() {
              formIsBusy = false;
            });
          }
        },
        child: const Text('Save Entry'),
      ),
    );
  }

  Widget buildDropzoneAndCreateCadetsButton() {
    return Column(
      children: [
        // Dropzone and Create Cadets Button
        const SizedBox(height: 16.0),
        const Card(
          elevation: 5,
          child: Center(
            child: SizedBox(
              height: 200,
              width: 300,
              child: DropzoneWidget(),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            //TODO: Implement logic to create cadets
          },
          child: const Text('Create Cadets'),
        ),
      ],
    );
  }

  Widget buildcreatedEntrySummary(Entry? savedEntry) {
    //TODO check against buildEntryDetailsSection and fix
    return savedEntry != null
        ?  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('new entry name is ${savedEntry.name}'),
                Text('new entry strength  is ${savedEntry.strength}'),
                Text('new entry number is ${savedEntry.number}'),
              ],
            ),
          )
        : Container();
  }
}
