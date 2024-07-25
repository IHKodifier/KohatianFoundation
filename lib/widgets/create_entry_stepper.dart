import 'package:flutter/material.dart';
import 'package:kohatian_foundation/models/entry_model.dart';
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
  late Entry? entry;
  late EntryProviderNotifier entryNotifier;

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
    entry = ref.watch(entryProvider) as Entry;
    entryNotifier = ref.read(entryProvider.notifier);


    return entry==null? 
    CircularProgressIndicator()
    :Container(
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
                : formIsSuccess
                    ? Center(
                        child: Text(
                            'Entry named ${entryNameController.text} created Successfully '))
                    : const Center(child: CircularProgressIndicator()),
          ),
          const Step(
            title: Text('Step 2'),
            content: CreateEntryStep2(),
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
      child: CreateEntryStep1(
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
       entry = Entry(
        name: entryNameController.text,
        number: entryNumberController.text,
        strength:
            int.tryParse(entryStrengthController.text) ?? 0, // Parse strength
        startDate: selectedStartDate != null
            ? Timestamp.fromDate(selectedStartDate!)
            : Timestamp.now(),
        endDate: selectedEndDate != null
            ? Timestamp.fromDate(selectedEndDate!)
            : Timestamp.now(),
        title: entryTitleController.text,
        slogan: entrySloganController.text,
      );
      setState(() {
        
      entry = Entry.fromMap(entry!.toMap());
        formIsBusy = true;
      });
      try {
        await FirebaseFirestore.instance
            .collection('entrys')
            .doc(entryNameController.text)
            .set(entry!.toMap());
             entryNotifier.updateEntry(newEntry: entry!);
        //show success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
           
            return AlertDialog(
              title: const Text('Success'),
              content:
                  Text('${entryNameController.text} created successfully!'),
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
          stepIndex = 1;
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
