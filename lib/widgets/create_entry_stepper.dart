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
  bool formIsBusy = false;
  bool formIsSuccess = false;

  late TextEditingController entryNameController;
  late TextEditingController entryNumberController;
  late TextEditingController entryStrengthController;
  late DateTime? selectedStartDate;
  late DateTime? selectedEndDate;
  late Function(DateTime) onStartDateChanged;
  late Function(DateTime) onEndDateChanged;
  late TextEditingController entryTitleController;
  late TextEditingController entrySloganController;
  late VoidCallback? onSave;
  late VoidCallback? onNext;
  late VoidCallback? onCancel;
  int stepIndex = 0;

  // get entryStrengthController => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    entryNameController = TextEditingController();
    entryNumberController = TextEditingController();
    entrySloganController = TextEditingController();
    entryStrengthController = TextEditingController();
    entryTitleController = TextEditingController();
    entrySloganController = TextEditingController();
    selectedStartDate = DateTime.now();
    selectedEndDate = DateTime.now();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    entryNameController.dispose();
    entryNumberController.dispose();
    entryStrengthController.dispose();
    entrySloganController.dispose();
    entryTitleController.dispose();
    entrySloganController.dispose();

    super.dispose();
  }

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
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  // Cancel Button
                  child: Container(
                    height: 50,
                    child: TextButton.icon(
                      onPressed: () {},
                      label: const Text('Cancel'),
                      icon: const FaIcon(FontAwesomeIcons.ban),
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
            content: !formIsBusy & !formIsSuccess
                ? entryFormStep1()
                : formIsSuccess? Center(child: Text('Entry named ${entryNameController.text} created Successfully ')):  const Center(child: CircularProgressIndicator()),
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

  Padding entryFormStep1() {
    return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EntryDetailsForm(
                    formKeyEntryDetails: formKey_EntryDetails,
                    entryNameController: entryNameController,
                    entryNumberController: entryNumberController,
                    entryStrengthController: entryStrengthController,
                    entrySloganController: entrySloganController,
                    entryTitleController: entryTitleController,
                    selectedEndDate: selectedEndDate,
                    selectedStartDate: selectedStartDate,
                    onCancel: () {},
                    onSave: () {},
                    onNext: () {},
                    onStartDateChanged: (date) {
                      setState(() {
                        selectedStartDate = date;
                      });
                    },
                    onEndDateChanged: (date) {
                      setState(() {
                        selectedEndDate = date;
                      });
                    },
                  ),
                );
  }

  Future<void> _saveEntryToFirestore() async {
    if (formKey_EntryDetails.currentState!.validate()) {
      // final docRef =
      print(
          '******************************** ENTRY FORM VALID*****************************');
      var entryData = {
        'entryName': entryNameController.text,
        'entryNumber': entryNumberController.text,
        'entryStrength': entryStrengthController.text,
        'entryTitle': entryTitleController.text,
        'entrySlogan': entrySloganController.text,
        'startDate': selectedStartDate != null
            ? Timestamp.fromDate(selectedStartDate!)
            : Timestamp.fromDate(DateTime.now()),
        'endDate': selectedEndDate != null
            ? Timestamp.fromDate(selectedEndDate!)
            : Timestamp.fromDate(DateTime.now()),
      };
      setState(() {
        formIsBusy = true;
      });
      try {
        await FirebaseFirestore.instance
            .collection('entrys')
            .doc(entryNameController.text)
            .set(entryData);
          //show success dialog
            showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content:  Text('${entryNameController.text} created successfully!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        setState(() {
          formIsSuccess = true;
        });

      } catch (e) {
        print(e);
      }
      setState(() {
        formIsBusy = false;
       
      });
    }
  }
}
