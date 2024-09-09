// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
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
  late DropzoneViewController controller;

  bool isHovered = false;
  bool formIsBusy = false;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    entryCreationStatus = EntryCreationStatus.initial;
  }

  @override
  Widget build(BuildContext context) {
    // Watch the EntryCreationNotifier for changes
    entryCreationStatus = ref.watch(entryCreationProvider).status;
    final newlyCreatedEntry = ref.watch(entryCreationProvider).entry;
    entryCreationNotifier = ref.read(entryCreationProvider.notifier);
    _startDate = entryCreationNotifier.startDate;
    _endDate = entryCreationNotifier.endDate;

    return Scaffold(
        appBar: AppBar(
          title: Text(' Entrys'),
          centerTitle: true,
        ),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                Container(
                  // height: 250,
                  child: Card(
                    elevation: 15,
                    child: entryList(),
                  ),
                ),
                Card(
                    elevation: 15,
                    margin: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: 600,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            entryCreationForm(),
                            buildSaveButton(),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    )),

                // addEntryCadetsDropzone(),
                SiteFooter(),
              ],
            ),
          ),
        ));
  }

  entryList() {
    return EntryStreamBuilder();
  }

  entryCreationForm() {
    return !formIsBusy & (entryCreationStatus == EntryCreationStatus.initial)
        ? Form(
            key: formKeyEntryDetails,
            child: Column(
              children: [
                Text(
                  'Create New Entry',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

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
                const SizedBox(
                  height: 12,
                ),
                //Date pickers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Start Date Picker
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1965),
                            lastDate: DateTime.now(),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              entryCreationNotifier.startDate = selectedDate;
                            });
                          }
                        },
                        child: Text(
                          entryCreationNotifier.startDate != null
                              ? '${entryCreationNotifier.startDate?.day} - ${entryCreationNotifier.startDate?.month} - ${entryCreationNotifier.startDate?.year}'
                              : 'Entry Start Date',
                        ),
                      ),
                    ),

                    // End Date Picker
                    SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1967),
                              lastDate: DateTime(2100),
                            );
                            if (selectedDate != null) {
                              setState(() {
                                entryCreationNotifier.endDate = selectedDate;
                              });
                            }
                          },
                          child: Text(
                            entryCreationNotifier.endDate != null
                                ? '${entryCreationNotifier.endDate?.day} - ${entryCreationNotifier.endDate?.month} - ${entryCreationNotifier.endDate?.year}'
                                : 'Entry End Date',
                          ),
                        )),
                  ],
                ),
              ],
            ),
          )
        : ref.watch(entryCreationProvider).entry != null
            ? buildEntrySuccess()
            : Center(child: const CircularProgressIndicator());
  }

  buildSaveButton() {
    return ref.watch(entryCreationProvider).entry == null
        ? SizedBox(
            height: 50,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (formKeyEntryDetails.currentState!.validate()) {
                    // Access controllers from providers
                    final entryName =
                        ref.read(entryNameControllerProvider).text;
                    final entryNumber =
                        ref.read(entryNumberControllerProvider).text;
                    final entryStrength =
                        ref.read(entryStrengthControllerProvider).text;
                    // final selectedStartDate = ref.read(entryStartDateProvider);
                    // final selectedEndDate = ref.read(entryEndDateProvider);
                    final entryTitle =
                        ref.read(entryTitleControllerProvider).text;
                    final entrySlogan =
                        ref.read(entrySloganControllerProvider).text;

                    // Create the Entry object
                    Entry newEntry = Entry(
                      name: entryName,
                      number: entryNumber,
                      strength: int.tryParse(entryStrength) ?? 0,
                      startDate: _startDate != null
                          ? Timestamp.fromDate(_startDate!)
                          : Timestamp.now(),
                      endDate: _endDate != null
                          ? Timestamp.fromDate(_endDate!)
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

                    ref.read(entryCreationProvider.notifier).success(newEntry);
                  }
                },
                child: const Text('Save Entry'),
              ),
            ),
          )
        : Container();
    setState(() {
      formIsBusy = false;
    });
  }

  addEntryCadetsDropzone() {
    var hoverColor = Theme.of(context).colorScheme.primary;
    return Column(
      children: [
        ElevatedButton(onPressed: () {}, child: const Text('Select File')),
        const SizedBox(
          height: 16,
        ),
        Stack(
          children: [
            Container(
              height: 120,
              width: 500,
              color: isHovered
                  ? Theme.of(context).colorScheme.secondary.withOpacity(0.5)
                  : hoverColor,
              child: DropzoneView(
                operation: DragOperation.copy,
                cursor: CursorType.grab,
                onCreated: (DropzoneViewController ctrl) => controller = ctrl,
                onLoaded: () {},
                onHover: () {
                  setState(() => isHovered = true);
                  print('zone is hovered');
                },
                onDrop: (value) async {
                  print('Dropzone received dropped file named ${value.name}');
                  final uploadedFile = await controller.getFileData(value);

                  // Parse the Excel file
                  var excel = Excel.decodeBytes(uploadedFile);

                  //  read the first sheet
                  var sheet = excel.tables.values.first;

                  // Iterate over rows, skipping the header row (index 0)
                  for (var row in sheet.rows.skip(1)) {
                    // Assuming your Excel columns are in this order:
                    // Kit No, Name, House, ... other properties
                    int kitNo =
                        int.tryParse(row[0]?.value.toString() ?? '') ?? 0;
                    String name = row[1]?.value.toString() ?? '';
                    String house = row[2]?.value.toString() ?? '';
                    String domicile = row[3]?.value.toString() ?? '';
                    String mobile = row[4]?.value.toString() ?? '';

                    // Create a Cadet object
                    Cadet cadet = Cadet(
                      kitNo: kitNo,
                      name: name,
                      house: house,
                      domicile: domicile,
                      mobileNumber: mobile,
                    );
                    print(cadet.toString());
                    //TODO
                    // Save the Cadet to Firestore
                    // await DbService().saveCadetToFirestore(
                    //     ref.read(entryCreationProvider).entry!.name, cadet);
                  }
                },
                onLeave: () {
                  setState(() {
                    isHovered = false;
                  });
                  print('zone has been left and number of files dropped ');
                },
                onDropMultiple: (value) {
                  if (value!.length > 1) {
                    print('Multiple files drag n drop is not supported ');
                    return;
                  }
                },
              ),
            ),
            Positioned(
              left: 150,
              top: 50,
              bottom: 50,
              child: Text('Drop a file here'),
            ),
          ],
        ),
      ],
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
        return null;
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

  buildEntrySuccess() {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
            'Entry named ${ref.read(entryCreationProvider).entry?.name} crreated Successfully'),
        const SizedBox(
          height: 16,
        ),
        const Text('next Up, you need to create cadet profiles in the entry'),
        const SizedBox(
          height: 16,
        ),
        const Text('You have two ways to do this:'),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () async {
              final entry = ref.watch(entryCreationProvider).entry;
              if (entry != null) {
                final cadets = List.generate(
                  entry.strength,
                  (index) => Cadet.empty(
                    kitNo: int.parse(
                        '${entry.number}${index < 9 ? '0${index + 1}' : index + 1}'
                            .padLeft(2, '0')),
                  ),
                );

                final batch = FirebaseFirestore.instance.batch();
                for (final cadet in cadets) {
                  batch.set(
                    FirebaseFirestore.instance
                        .collection('entrys')
                        .doc(entry.name)
                        .collection('cadets')
                        .doc(cadet.kitNo.toString()),
                    cadet.toMap(),
                  );
                }

                await batch.commit();
                if (kDebugMode) {
                  print('Cadets written to Firestore');
                }
              }
            },
            child: Text(
                'create ${ref.read(entryCreationProvider).entry?.strength.toString()} Blank cadet Profiles')),
        const SizedBox(
          height: 16,
        ),
        const Text(
            'Or you can browse/drag an drop an Excel file to create cadet profiles for cadets of this entry.'),
        const SizedBox(
          height: 16,
        ),
        addEntryCadetsDropzone(),
      ],
    );
  }

// // Function to handle file dropping
//   void _handleFileDrop(List<html.File> files) async {
//     if (files.isNotEmpty) {
//       html.File file = files.first;
//       final reader = html.FileReader();

//       reader.readAsArrayBuffer(file);

//       reader.onLoad.listen((event) async {
//         var bytes = reader.result as Uint8List;
//         var excel = Excel.decodeBytes(bytes);

//         // Assuming the first sheet is the one you want to read
//         var sheet = excel.tables.values.first;

//         // Get the entry name from your provider
//         final entryName = ref.read(entryNameControllerProvider).text;

//         // Iterate over rows, skipping the header row (index 0)
//         for (var row in sheet.rows.skip(1)) {
//           // Assuming your Excel columns are in this order:
//           // Kit No, Name, House, ... other properties
//           int kitNo = int.tryParse(row[0]?.value.toString() ?? '') ?? 0;
//           String name = row[1]?.value.toString() ?? '';
//           String house = row[2]?.value.toString() ?? '';
//           // ... extract other properties similarly

//           // Create a Cadet object
//           Cadet cadet = Cadet(
//             kitNo: kitNo,
//             name: name,
//             house: house,
//             // ... set other properties
//           );

//           // Save the Cadet to Firestore
//           await DbService().saveCadetToFirestore(entryName, cadet);
//         }

//         if (kDebugMode) {
//           print('Cadets from Excel imported to Firestore');
//         }
//       });
//     }
//   }
}
