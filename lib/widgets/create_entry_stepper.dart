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
    return Container(
      width:500,
      height: 500,
      child: Stepper(
        elevation: 0,
        type: StepperType.horizontal, 
        currentStep: stepIndex,
        onStepTapped: (index) {
          setState(() {
            stepIndex = index;
          });
        },
        steps: const [
        
        Step(title: Text('Step 1'),
        content: Text('Content Step 1') ),
        Step(title: Text('Step 2'),
        content: Text('Content Step 2'),),
        Step(title: Text('Step 3'),
        content: Text('Content Step 3'),)],
      ),
    );
  }
}
