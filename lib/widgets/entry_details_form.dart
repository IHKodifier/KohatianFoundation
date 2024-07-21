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
  final VoidCallback onSave;
  final VoidCallback onNext;
  final VoidCallback onCancel;

  const EntryDetailsForm({
    Key? key,
    required this.formKeyEntryDetails,
    required this.entryNameController,
    required this.entryNumberController,
    required this.entryStrengthController,
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.entryTitleController,
    required this.entrySloganController,
    required this.onSave,
    required this.onNext,
    required this.onCancel,
  }) : super(key: key);

  @override
  _EntryDetailsFormState createState() => _EntryDetailsFormState();
}

class _EntryDetailsFormState extends State<EntryDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        child: Card(
             
          elevation: 5,
          child: Form(
            key: widget.formKeyEntryDetails,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField( //Entry Name
                    controller: widget.entryNameController,
                    decoration: const InputDecoration(labelText: 'Entry Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter entry name';
                      }
                      return null;
                    },
                  ),
                  TextFormField( //Entry Number
                    controller: widget.entryNumberController,
                    decoration: const InputDecoration(labelText: 'Entry Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter entry number';
                      }
                      return null;
                    },
                  ),
                  TextFormField( //Entry Strength
                    controller: widget.entryStrengthController,
                    decoration: const InputDecoration(labelText: 'Entry Strength'),
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
                 SizedBox(height: 12.0),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Show the date picker for start date
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ).then((date) {
                            if (date != null) {
                              widget.onStartDateChanged(date);
                            }
                          });
                        },
                        child: Text(
                          widget.selectedStartDate != null
                              ? '${widget.selectedStartDate!.toLocal()}'
                              : 'Select Start Date',
                        ),
                      ),
                       ElevatedButton(
                    onPressed: () {
                      // Show the date picker for end date
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((date) {
                        if (date != null) {
                          widget.onEndDateChanged(date);
                        }
                      });
                    },
                    child: Text(
                      widget.selectedEndDate != null
                          ? '${widget.selectedEndDate!.toLocal()}'
                          : 'Select End Date',
                    ),
                  ),
                   
                   
                    ],
                  ),
              
                  TextFormField(
                    controller: widget.entryTitleController,
                    decoration:
                        const InputDecoration(labelText: 'Entry Title (Optional)'),
                  ),
                  TextFormField(
                    controller: widget.entrySloganController,
                    decoration:
                        const InputDecoration(labelText: 'Entry Slogan (Optional)'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: widget.onCancel,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Icon(Icons.cancel),
                        ),
                        ElevatedButton(
                          onPressed: widget.onSave,
                          child: const Text('Save'),
                        ),
                        ElevatedButton(
                          onPressed: widget.onNext,
                          child: const Text('Next'),
                        ),
                      ],
                    ),
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
