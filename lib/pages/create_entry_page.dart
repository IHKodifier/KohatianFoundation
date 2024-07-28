import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CreateEntryPage extends ConsumerStatefulWidget {
  const CreateEntryPage({super.key});

  @override
  ConsumerState<CreateEntryPage> createState() => _CreateEntryPageState();
}

class _CreateEntryPageState extends ConsumerState<CreateEntryPage> {
  final GlobalKey<FormState> formKeyEntryDetails = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Entry'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Entry Details Section
              Text(
                'Entry Details',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16.0),

              // Entry Details Form and Dropzone/Cadet Creation in a Row
              Row(
                children: [
                  // Entry Details Form
                  Expanded(
                    flex: 2, // Adjust flex for width ratio
                    child: Form(
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
                            controller:
                                ref.read(entryStrengthControllerProvider),
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

                          // Start Date
                          ElevatedButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate:
                                    ref.watch(entryStartDateProvider) ??
                                        DateTime.now(),
                                firstDate: DateTime(1965),
                                lastDate: DateTime.now(),
                              ).then((date) {
                                if (date != null) {
                                  ref
                                      .read(entryStartDateProvider.notifier)
                                      .state = date;
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
                                initialDate: ref.watch(entryEndDateProvider) ??
                                    DateTime.now(),
                                firstDate: DateTime(1970),
                                lastDate: DateTime.now(),
                              ).then((date) {
                                if (date != null) {
                                  ref
                                      .read(entryEndDateProvider.notifier)
                                      .state = date;
                                }
                              });
                            },
                            child: Text(
                              ref.watch(entryEndDateProvider) != null
                                  ? '${ref.watch(entryEndDateProvider)!.toLocal().day} - ${ref.watch(entryEndDateProvider)!.toLocal().month} - ${ref.watch(entryEndDateProvider)!.toLocal().year}'
                                  : 'Select End Date',
                            ),
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
                    ),
                  ),

                  // Dropzone and Create Cadets Button in a Column
                  Expanded(
                    flex: 1, // Adjust flex for width ratio
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        children: [
                          // Dropzone
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

                          // Create Cadets Button
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              //TODO
                              // Trigger the cadet creation process
                              // You'll need to implement the logic here
                              // based on your application's requirements.
                              // This might involve:
                              // 1. Reading the entry strength from the form.
                              // 2. Creating a new entry in your database.
                              // 3. Generating cadet profiles based on the strength.
                              // 4. Saving the cadet profiles to your database.
                              // 5. Potentially navigating to a new screen to manage cadets.
                              // ...
                              // Example:
                              // int strength = int.parse(ref.read(entryStrengthControllerProvider).text);
                              // // ... create entry and cadets ...
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => CadetManagementPage(), // Replace with your cadet management screen
                              //   ),
                              // );
                            },
                            child: const Text('Create Cadets'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Save Button
              const SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    //TODO ... your logic to save the Entry
                  },
                  child: const Text('Save Entry'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
