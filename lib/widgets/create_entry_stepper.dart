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
  late EntryCreationNotifier entryNotifier;

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
    entry = ref.watch(entryCreationProvider).entry;
    entryNotifier = ref.read(entryCreationProvider.notifier);

    return formIsBusy
        ? Center(child: CircularProgressIndicator())
        : Container(
            // width:500,
            height: 500,
            child: Stepper(
              elevation: 15,
              type: StepperType.vertical,
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
                          : const Center(child: CircularProgressIndicator(),),
                ),
                 Step(

                  //TODO  fix null value error when no entry selected
                  title: ref.watch(entryCreationProvider).entry != null
                      ? Text(
                          ' Add Cadets to ${ref.watch(entryCreationProvider).entry!.name}')
                      : const Text('Step 2'), // Default title if entry is null
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
     
      ),
    );
  }

  Future<void> _saveEntryToFirestore() async {
    if (formKey_EntryDetails.currentState!.validate()) {
      print(
          '******************************** ENTRY FORM VALID*****************************');
      
      // Access controllers from providers
      final entryName = ref.read(entryNameControllerProvider).text;
      final entryNumber = ref.read(entryNumberControllerProvider).text;
      final entryStrength = ref.read(entryStrengthControllerProvider).text;
      final selectedStartDate = ref.read(entryStartDateProvider);
      final selectedEndDate = ref.read(entryEndDateProvider);
      final entryTitle = ref.read(entryTitleControllerProvider).text;
      final entrySlogan = ref.read(entrySloganControllerProvider).text;
      // final docRef =

  // Create the Entry object
      Entry  newEntry = Entry(
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
      setState(() {
       
        formIsBusy = true;
      });
      try {
        await FirebaseFirestore.instance
            .collection('entrys')
            .doc(entryName)
            .set(newEntry.toMap());
         entryNotifier.success(newEntry);
       
        //show success dialog
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${newEntry.name} created successfully!'),
            duration: Duration(seconds: 2),
          ),
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
