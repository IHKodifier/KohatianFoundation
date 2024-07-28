import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CreateEntryPage extends ConsumerStatefulWidget {
  const CreateEntryPage({super.key});

  @override
  ConsumerState<CreateEntryPage> createState() => _CreateEntryPageState();
}

class _CreateEntryPageState extends ConsumerState<CreateEntryPage> {
  final GlobalKey<FormState> formKeyEntryDetails = GlobalKey<FormState>();
  List<Widget> formFields = [];
  bool formIsBusy = false;

  @override
  Widget build(BuildContext context) {
    final savedEntry = ref.watch(entryCreationProvider).entry;

    // Use a ternary operator to handle the initial null state
    final entryForm = savedEntry == null
        ? Form(
            key: formKeyEntryDetails,
            child: Column(
              children: [
                // Entry Name
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

                SizedBox(height: 16),
                // Start Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: ref.watch(entryStartDateProvider) ??
                              DateTime.now(),
                          firstDate: DateTime(1965),
                          lastDate: DateTime.now(),
                        ).then((date) {
                          if (date != null) {
                            ref.read(entryStartDateProvider.notifier).state =
                                date;
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
                          initialDate:
                              ref.watch(entryEndDateProvider) ?? DateTime.now(),
                          firstDate: DateTime(1970),
                          lastDate: DateTime.now(),
                        ).then((date) {
                          if (date != null) {
                            ref.read(entryEndDateProvider.notifier).state =
                                date;
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
                ),

                // Entry Title
                TextFormField(
                  controller: ref.read(entryTitleControllerProvider),
                  decoration: const InputDecoration(
                    labelText: 'Entry Title (Optional)',
                  ),
                ),

                // Entry Slogan
                TextFormField(
                  controller: ref.read(entrySloganControllerProvider),
                  decoration: const InputDecoration(
                    labelText: 'Entry Slogan (Optional)',
                  ),
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
                    // Entry Details Section
                    if (savedEntry == null)
                      Text(
                        'Entry Details',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    const SizedBox(height: 16.0),

                    // Entry Details Form or Success Message
                    entryForm,

                    // Save Button
                    const SizedBox(height: 32.0),
                    if (savedEntry == null)
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKeyEntryDetails.currentState!.validate()) {
                              // Access controllers from providers
                              final entryName =
                                  ref.read(entryNameControllerProvider).text;
                              final entryNumber =
                                  ref.read(entryNumberControllerProvider).text;
                              final entryStrength = ref
                                  .read(entryStrengthControllerProvider)
                                  .text;
                              final selectedStartDate =
                                  ref.read(entryStartDateProvider);
                              final selectedEndDate =
                                  ref.read(entryEndDateProvider);
                              final entryTitle =
                                  ref.read(entryTitleControllerProvider).text;
                              final entrySlogan =
                                  ref.read(entrySloganControllerProvider).text;

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
                                title: entryTitle,
                                slogan: entrySlogan,
                              );

                              // Save the Entry to Firestore
                              setState(() {
                                formIsBusy = true;
                              });
                              await DbService().saveEntryToFirestore(newEntry);
                              setState(() {
                                formIsBusy = false;
                              });

                              // ref
                              //     .read(entryCreationProvider.notifier)
                              //     .saveEntry(newEntry);
                            }
                          },
                          child: const Text('Save Entry'),
                        ),
                      ),

                    // Dropzone and Create Cadets Button
                    const SizedBox(height: 16.0),
                    Card(
                      elevation: 5,
                      child: Center(
                        child: Container(
                          height: 200,
                          width: double.infinity,
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
                ),
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
