// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CreateEntryPage extends ConsumerStatefulWidget {
  const CreateEntryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEntryPageState();
}

class _CreateEntryPageState extends ConsumerState<CreateEntryPage> {
  final GlobalKey<FormState> formKeyEntryDetails = GlobalKey<FormState>();
  late EntryCreationStatus entryCreationStatus;
  late EntryCreationNotifier entryCreationNotifier;
  bool formIsBusy = false;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    entryCreationStatus = EntryCreationStatus.initial;
  }

  @override
  Widget build(BuildContext context) {
    // Watch the EntryCreationNotifier for changes
    entryCreationStatus = ref.watch(entryCreationProvider).status;
    final newlyCreatedEntry = ref.watch(entryCreationProvider).entry;
    entryCreationNotifier = ref.read(entryCreationProvider.notifier);
    _startDate = entryCreationNotifier.startDate;
    _endDate = entryCreationNotifier.endDate;

    return Scaffold(
        appBar: AppBar(
          title: const Text('create Entry'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                entryList(),
                entryCreationForm(),
                buildSaveButton(),
                addEntryCadetsDropzone(),
                const SiteFooter(),
              ],
            ),
          ),
        ));
  }

  entryList() {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.deepOrange,
      child: const Text('entries list goes here'),
    );
  }

  entryCreationForm() {
    return !formIsBusy & (entryCreationStatus == EntryCreationStatus.initial)
        ? Form(
            key: formKeyEntryDetails,
            child: Column(
              children: [
                // Entry Name
                _buildTextFormField(
                  controller: ref.read(entryNameControllerProvider),
                  labelText: 'Entry Name',
                ),

                // Entry Number
                _buildTextFormField(
                  controller: ref.read(entryNumberControllerProvider),
                  labelText: 'Entry Number',
                ),

                // Entry Strength
                _buildTextFormField(
                  controller: ref.read(entryStrengthControllerProvider),
                  labelText: 'Entry Strength',
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 16),

                //Date pickers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Start Date Picker
                    ElevatedButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1965),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            entryCreationNotifier.startDate = selectedDate;
                          });
                        }
                      },
                      child: Text(
                        entryCreationNotifier.startDate != null
                            ? '${entryCreationNotifier.startDate?.day} - ${entryCreationNotifier.startDate?.month} - ${entryCreationNotifier.startDate?.year}'
                            : 'Entry Start Date',
                      ),
                    ),
                    // End Date Picker
                    ElevatedButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            entryCreationNotifier.endDate = selectedDate;
                          });
                        }
                      },
                      child: Text(
                        entryCreationNotifier.endDate != null
                            ? '${entryCreationNotifier.endDate?.day} - ${entryCreationNotifier.endDate?.month} - ${entryCreationNotifier.endDate?.year}'
                            : 'Entry End Date',
                      ),
                    ),
                  ],
                ),

                // Entry Title
                _buildTextFormField(
                    controller: ref.read(entryTitleControllerProvider),
                    labelText: 'Entry Title (Optional)',
                    reuiresValidation: false),

                // Entry Slogan
                _buildTextFormField(
                  controller: ref.read(entrySloganControllerProvider),
                  labelText: 'Entry Slogan (Optional)',
                  reuiresValidation: false,
                ),
              ],
            ),
          )
        : ref.watch(entryCreationProvider).entry != null
            ? buildEntrySuccess()
            : const CircularProgressIndicator();
  }

  buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          if (formKeyEntryDetails.currentState!.validate()) {
            // Access controllers from providers
            final entryName = ref.read(entryNameControllerProvider).text;
            final entryNumber = ref.read(entryNumberControllerProvider).text;
            final entryStrength =
                ref.read(entryStrengthControllerProvider).text;
            // final selectedStartDate = ref.read(entryStartDateProvider);
            // final selectedEndDate = ref.read(entryEndDateProvider);
            final entryTitle = ref.read(entryTitleControllerProvider).text;
            final entrySlogan = ref.read(entrySloganControllerProvider).text;

            // Create the Entry object
            Entry newEntry = Entry(
              name: entryName,
              number: entryNumber,
              strength: int.tryParse(entryStrength) ?? 0,
              startDate: _startDate != null
                  ? Timestamp.fromDate(_startDate!)
                  : Timestamp.now(),
              endDate: _endDate != null
                  ? Timestamp.fromDate(_endDate!)
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

            ref.read(entryCreationProvider.notifier).success(newEntry);
          }
        },
        child: const Text('Save Entry'),
      ),
    );
    setState(() {
      formIsBusy = false;
    });
  }

  addEntryCadetsDropzone() {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.deepPurple,
      child: const Text('dropzone goes here'),
    );
  }

  Widget _buildTextFormField(
      {required TextEditingController controller,
      required String labelText,
      TextInputType keyboardType = TextInputType.text,
      bool reuiresValidation = true}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      keyboardType: keyboardType,
      validator: (value) {
        if (reuiresValidation) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          if (keyboardType == TextInputType.number &&
              int.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
          return null;
        }
        return null;
      },
    );
  }

  Widget _buildDatePickerRow(
      // {
      // required StateNotifier<DateTime?> controller,
      // required String labelText,

      // }
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: entryCreationNotifier.startDate ?? DateTime.now(),
              firstDate: DateTime(1965),
              lastDate: DateTime.now(),
            ).then((date) {
              if (date != null) {
                // controller.updateStartDate(date);
                ref.read(entryCreationProvider.notifier).updateStartDate(date);
              }
            });
          },
          child: Text(
            entryCreationNotifier.startDate != null
                ? '${entryCreationNotifier.startDate!.toLocal().day} - ${entryCreationNotifier.startDate!.toLocal().month} - ${entryCreationNotifier.startDate!.toLocal().year}'
                : 'Entry Start Dat',
          ),
        ),
      ],
    );
  }

  buildEntrySuccess() {
    return Column(
      children: [
          const SizedBox(
          height: 16,
        ),
        Text(
            'Entry named ${ref.read(entryCreationProvider).entry?.name} crreated Successfully'),
        const SizedBox(
          height: 16,
        ),
        const Text('next Up, you need to create cadet profiles in the entry'),
          const SizedBox(
          height: 16,
        ),
        const Text('You have two ways to do this:'),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(onPressed: () {}, 
        child: Text('create ${ref.read(entryCreationProvider).entry?.strength.toString()} Blank cadet Profiles')),
          const SizedBox(
          height: 16,
        ),
            const Text('Or you can browse/drag an drop an Excel file to create cadet profiles for cadets of this entry.'),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
