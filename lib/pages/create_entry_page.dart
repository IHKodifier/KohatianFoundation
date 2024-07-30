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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    entryCreationStatus = EntryCreationStatus.initial;
  }

  @override
  Widget build(BuildContext context) {
    final entryCreationStatus = ref.watch(entryCreationProvider).status;
    final newlyCreatedEntry = ref.watch(entryCreationProvider).entry;
     entryCreationNotifier = ref.read(entryCreationProvider.notifier);

    // print(entryCreationStatus.toString());
    // print(newlyCreatedEntry.toString());

    return Scaffold(
        appBar: AppBar(
          title: Text('create Entry'),
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
                SiteFooter(),
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
      child: Text('entries list goes here'),
    );
  }

  entryCreationForm() {
    return Form(
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
          // Start Date
          // _buildDatePickerRow(
          //   controller: ref.read(entryStartDateProvider.notifier),
          //   labelText: 'Select Start Date',
          // ),

          // // End Date
          // _buildDatePickerRow(
          //   controller: ref.read(entryEndDateProvider.notifier),
          //   labelText: 'Select End Date',
          // ),

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
    );
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
          }
        },
        child: const Text('Save Entry'),
      ),
    );
  }

  addEntryCadetsDropzone() {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.deepPurple,
      child: Text('dropzone goes here'),
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
}
