import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CreateEntryStepper extends ConsumerStatefulWidget {
  const CreateEntryStepper({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEntryStepperState();
}

class _CreateEntryStepperState extends ConsumerState<CreateEntryStepper> {
  int stepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: stepIndex,
      onStepTapped: (index) {
        setState(() {
          stepIndex = index;
        });
      },
      steps: const [
        // EntryDetailsForm(formKeyEntryDetails: formKeyEntryDetails, entryNameController: entryNameController, entryNumberController: entryNumberController, entryStrengthController: entryStrengthController, selectedStartDate: selectedStartDate, selectedEndDate: selectedEndDate, onStartDateChanged: onStartDateChanged, onEndDateChanged: onEndDateChanged, entryTitleController: entryTitleController, entrySloganController: entrySloganController, onSave: onSave, onNext: onNext, onCancel: onCancel),
      Step(title: Text('Step 1'),
      content: Text('Content Step 1') ),
      Step(title: Text('Step 2'),
      content: Text('Content Step 2'),),
      Step(title: Text('Step 3'),
      content: Text('Content Step 3'),)],
    );
  }
}
