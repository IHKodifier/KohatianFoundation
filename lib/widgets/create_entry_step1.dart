import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CreateEntryStep1 extends ConsumerStatefulWidget {
  final GlobalKey<FormState> formKeyEntryDetails;

  const CreateEntryStep1({required this.formKeyEntryDetails, super.key});

 @override
  ConsumerState<CreateEntryStep1> createState() => _CreateEntryStep1State();
}

class _CreateEntryStep1State extends ConsumerState<CreateEntryStep1> {
 @override
 Widget build(BuildContext context) {

 final entryNameController = ref.watch(entryNameControllerProvider);
  final entryNumberController = ref.watch(entryNumberControllerProvider);
  final entryStrengthController = ref.watch(entryStrengthControllerProvider);
  final selectedStartDate = ref.watch(entryStartDateProvider);
  final selectedEndDate = ref.watch(entryEndDateProvider);
  final entryTitleController = ref.watch(entryTitleControllerProvider);
  final entrySloganController = ref.watch(entrySloganControllerProvider);

// final entryStartDate = ref.watch(entryStartDateProvider);
// final entryEndDate = ref.watch(entryEndDateProvider);




    return Dialog(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Form(
            key: widget.formKeyEntryDetails,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ' Entry Details',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  // Text(
                  //   'Step 1 of 3',
                  //   style: Theme.of(context).textTheme.labelMedium,
                  // ),
                  TextFormField(
                    //Entry Name
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
                  //  Icon(Icons.question_mark),
                  TextFormField(
                    //Entry Number
                    controller: ref.read(entryNumberControllerProvider),
                    decoration:
                        const InputDecoration(labelText: 'Entry Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter entry number';
                      }
                      return null;
                    },
                  ),
                  //  Icon(Icons.question_mark),
                  TextFormField(
                    //Entry Strength
                    controller: ref.read(entryStrengthControllerProvider),
                    decoration:
                        const InputDecoration(labelText: 'Entry Strength'),
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
                  //  Icon(Icons.question_mark),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        //Start date picker
                        onPressed: () {
                          // Show the date picker for start date
                          showDatePicker(
                            context: context,
                            initialDate:
                                selectedStartDate ?? DateTime.now(),
                            firstDate: DateTime(1965),
                            lastDate: DateTime.now(),
                          ).then((date) {
                            if (date != null) {
                              setState(() {
                                //TODO
                                ref.read(entryStartDateProvider.notifier).state= date;
                                // ref.watch(entryEndDateProvider
                              });
                            }
                          });
                        },
                        child: Text(
                          selectedStartDate!= null
                              ? '${selectedStartDate.day} - ${selectedStartDate.month} - ${selectedStartDate.year}'
                              : 'Select Start Date',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Show the date picker for end date
                          showDatePicker(
                            context: context,
                            initialDate:
                                selectedEndDate ?? DateTime.now(),
                            firstDate: DateTime(1970),
                            lastDate: DateTime.now(),
                          ).then((date) {
                            if (date != null) {
                              //TODO
                          ref.read(entryEndDateProvider.notifier).state= date;
                              // ref.watch(entryEndDateProvider)
                            }
                          });
                        },
                        child: Text(
                          selectedEndDate != null
                              ? '${selectedEndDate.day} - ${selectedEndDate.month} - ${selectedEndDate.year}'
                              : 'Select End Date',
                        ),
                      ),
                    ],
                  ),

                  TextFormField(
                    controller: entryTitleController,
                    decoration: const InputDecoration(
                        labelText: 'Entry Title (Optional)'),
                  ),
                  TextFormField(
                    controller: entrySloganController,
                    decoration: const InputDecoration(
                        labelText: 'Entry Slogan (Optional)'),
                  ),
               
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
