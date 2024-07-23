import 'package:flutter/material.dart';
import 'package:kohatian_foundation/pages/combeback_gemini_code1.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CreateEntryStepper extends ConsumerStatefulWidget {
  const CreateEntryStepper({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEntryStepperState();
}

class _CreateEntryStepperState extends ConsumerState<CreateEntryStepper> {
  final formKey_EntryDetails = GlobalKey<FormState>();
  int stepIndex = 0;

  get entryStrengthController => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width:500,
      height: 500,
      child: Stepper(
        elevation: 15,
        type: StepperType.horizontal,
        currentStep: stepIndex,
        onStepTapped: (index) {
          setState(() {
            stepIndex = index;
          });
        },
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              children: [
                Expanded(
                  //Save and Next Button,
                  child: Container(
                    height: 50,
                    child: ElevatedButton.icon(
                      // onPressed: details.onStepContinue,
                      onPressed: _saveEntryToFirestore,
                      label: const Text('Save and next'),
                      icon: const FaIcon(FontAwesomeIcons.floppyDisk),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  // Cancel Button
                  child: Container(
                    height: 50,
                    child: TextButton.icon(
                      onPressed: () {},
                      label: const Text('Cancel'),
                      icon: const FaIcon(FontAwesomeIcons.cancel),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('Step 1'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: EntryDetailsForm(
                formKeyEntryDetails: formKey_EntryDetails,
                onCancel: () {},
                onSave: () {},
                onNext: () {},
                onStartDateChanged: (date) {},
                onEndDateChanged: (date) {},
              ),
            ),
          ),
          const Step(
            title: Text('Step 2'),
            content: Text('Content Step 2'),
          ),
          const Step(
            title: Text('Step 3'),
            content: Text('Content Step 3'),
          )
        ],
      ),
    );
  }

  void _saveEntryToFirestore() {
    if (formKey_EntryDetails.currentState!.validate()) {
      print('******************************** ENTRY FORM VALID*****************************');
      try
    }
  }
}
