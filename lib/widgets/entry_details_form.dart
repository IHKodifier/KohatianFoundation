import 'package:flutter/material.dart';

class EntryDetailsForm extends StatefulWidget {
  final GlobalKey<FormState> formKeyEntryDetails;
  final TextEditingController entryNameController;
  final TextEditingController entryNumberController;
  final TextEditingController entryStrengthController;
  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;
  final Function(DateTime) onStartDateChanged;
  final Function(DateTime) onEndDateChanged;
  final TextEditingController entryTitleController;
  final TextEditingController entrySloganController;
  final VoidCallback? onSave;
  final VoidCallback? onNext;
  final VoidCallback? onCancel;

  EntryDetailsForm({
    required this.formKeyEntryDetails,
    super.key,
    required this.entryNameController,
    required this.entryNumberController,
    required this.entryStrengthController,
    required this.entrySloganController,
    required this.entryTitleController,
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    this.onSave,
    this.onNext,
    this.onCancel,
  });

  @override
  _EntryDetailsFormState createState() => _EntryDetailsFormState();
}

class _EntryDetailsFormState extends State<EntryDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
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
                    controller: widget.entryNameController,
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
                    controller: widget.entryNumberController,
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
                    controller: widget.entryStrengthController,
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
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(//Start date picker
                        onPressed: () {
                          // Show the date picker for start date
                          showDatePicker(
                            context: context,
                            initialDate: widget.selectedStartDate ?? DateTime.now(),
                            firstDate: DateTime(1965),
                            lastDate: DateTime.now(),
                          ).then((date) {
                            if (date != null) {
                              setState(() {
                                widget.onStartDateChanged(date);
                          
                             
                              });
                            }
                          });
                        },
                        child: Text(
                          widget.selectedStartDate != null
                              ? '${widget.selectedStartDate!.day} - ${widget.selectedStartDate!.month} - ${widget.selectedStartDate!.year}'
                              : 'Select Start Date',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Show the date picker for end date
                          showDatePicker(
                            context: context,
                            initialDate: widget.selectedEndDate ?? DateTime.now(),
                            firstDate: DateTime(1970),
                            lastDate: DateTime.now(),
                          ).then((date) {
                            if (date != null) {
                              widget.onEndDateChanged(date);
                            }
                          });
                        },
                        child: Text(
                          widget.selectedEndDate != null
                              ? '${widget.selectedEndDate!.day} - ${widget.selectedEndDate!.month} - ${widget.selectedEndDate!.year}'
                              : 'Select End Date',
                        ),
                      ),
                    ],
                  ),

                  TextFormField(
                    controller: widget.entryTitleController,
                    decoration: const InputDecoration(
                        labelText: 'Entry Title (Optional)'),
                  ),
                  TextFormField(
                    controller: widget.entrySloganController,
                    decoration: const InputDecoration(
                        labelText: 'Entry Slogan (Optional)'),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       ElevatedButton(
                  //         onPressed: widget.onCancel,
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.red,
                  //         ),
                  //         child: const Icon(Icons.cancel),
                  //       ),
                  //       ElevatedButton(
                  //         onPressed: widget.onSave,
                  //         child: const Text('Save'),
                  //       ),
                  //       ElevatedButton(
                  //         onPressed: widget.onNext,
                  //         child: const Text('Next'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
