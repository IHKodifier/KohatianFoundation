// import 'package:flutter/material.dart';
// import 'package:kohatian_foundation/widget_export.dart';

// // ... other imports

// class AdminCenterCore extends StatefulWidget {
//   const AdminCenterCore({Key? key}) : super(key: key);

//   @override
//   _AdminCenterCoreState createState() => _AdminCenterCoreState();
// }

// class _AdminCenterCoreState extends State<AdminCenterCore> {
//   final _formKeyStep1 = GlobalKey<FormState>();
//   final _entryNameController = TextEditingController();
//   final _entryNumberController = TextEditingController();
//   final _entryStrengthController = TextEditingController();
//   final _entryTitleController = TextEditingController();
//   final _entrySloganController = TextEditingController();

//   DateTime? _selectedStartDate;
//   DateTime? _selectedEndDate;

//   bool _firestoreWriteInProgress = false;
//   String? _firestoreWriteMessage;

//   @override
//   void dispose() {
//     _entryNameController.dispose();
//     _entryNumberController.dispose();
//     _entryStrengthController.dispose();
//     _entryTitleController.dispose();
//     _entrySloganController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Container(
//         margin: const EdgeInsets.only(top: 16.0),
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // Card for Admin Dashboard
//             // adminDashboardCard(context),
//             const SizedBox(height: 16.0),

//             // Card for Entry model creation
//             createEntryCard(context),
//             const SizedBox(height: 16.0),

//             // Card for EntryCoordinator settings
//             // createEntryCoordinatorCard(context),
//             const SizedBox(height: 16.0),

//             // Card for other settings
//             // otherSettingsCard(context),
//             // const SizedBox(height: 16.0),
//           ],
//         ),
//       ),
//     );
//   }

//   InkWell createEntryCard(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         //TODO
//         showDialog(
//           context: context,
//           builder: (_) => EntryDetailsForm(
//             formKey: _formKeyStep1,
//             entryNameController: _entryNameController,
//             entryNumberController: _entryNumberController,
//             entryStrengthController: _entryStrengthController,
//             selectedStartDate: _selectedStartDate,
//             selectedEndDate: _selectedEndDate,
//             onStartDateChanged: (date) {
//               setState(() {
//                 _selectedStartDate = date;
//               });
//             },
//             onEndDateChanged: (date) {
//               setState(() {
//                 _selectedEndDate = date;
//               });
//             },
//             entryTitleController: _entryTitleController,
//             entrySloganController: _entrySloganController,
//             onSave: () {
//               _saveEntryToFirestore();
//             },
//             onNext: () {
//               // Handle next action (e.g., move to the next step in the Stepper)
//             },
//             onCancel: () {
//               // Handle cancel action (e.g., close the dialog)
//             },
//           ),
//         );
//       },
//       child: Card(
//         elevation: 5,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               // child: createEntryContent(context),
//             ),
//           ],
//         ),
//         //TODO  Entry creation content
//       ),
//     );
//   }

//   // ... other card widgets (createEntryCoordinatorCard, otherSettingsCard)

//   Future<void> _saveEntryToFirestore() async {
//     if (_formKeyStep1.currentState!.validate()) {
//       // Get the current user
//       final user = FirebaseAuth.instance.currentUser;

//       if (user != null) {
//         // Create a new entry document in Firestore
//         final entryRef = FirebaseFirestore.instance.collection('entries').doc();

//         // Get the entry data from the controllers
//         final entryData = {
//           'entry_name': _entryNameController.text,
//           'entry_number': _entryNumberController.text,
//           'entry_strength': int.parse(_entryStrengthController.text),
//           'start_date': _selectedStartDate?.millisecondsSinceEpoch,
//           'end_date': _selectedEndDate?.millisecondsSinceEpoch,
//           'entry_title': _entryTitleController.text,
//           'entry_slogan': _entrySloganController.text,
//           'created_by': user.uid,
//           'created_at': Timestamp.now(),
//         };

//         setState(() {
//           _firestoreWriteInProgress = true;
//           _firestoreWriteMessage = 'Writing to Firestore...';
//         });

//         // Save the entry data to Firestore
//         await entryRef.set(entryData).then((_) {
//           setState(() {
//             _firestoreWriteInProgress = false;
//             _firestoreWriteMessage = 'Firestore write successful!';
//           });
//         }).catchError((error) {
//           setState(() {
//             _firestoreWriteInProgress = false;
//             _firestoreWriteMessage = 'Firestore write error: $error';
//           });
//         });
//       } else {
//         // Handle the case where the user is not logged in
//         // ...
//       }
//     }
//   }

//   // ... other methods (createBlankCadets, pickXlsxFile)
// }

// // class EntryDetailsForm extends StatefulWidget {
// //   final GlobalKey<FormState> formKey;
// //   final TextEditingController entryNameController;
// //   final TextEditingController entryNumberController;
// //   final TextEditingController entryStrengthController;
// //   final DateTime? selectedStartDate;
// //   final DateTime? selectedEndDate;
// //   final Function(DateTime) onStartDateChanged;
// //   final Function(DateTime) onEndDateChanged;
// //   final TextEditingController entryTitleController;
// //   final TextEditingController entrySloganController;
// //   final VoidCallback onSave;
// //   final VoidCallback onNext;
// //   final VoidCallback onCancel;

// //   const EntryDetailsForm({
// //     Key? key,
// //     required this.formKey,
// //     required this.entryNameController,
// //     required this.entryNumberController,
// //     required this.entryStrengthController,
// //     required this.selectedStartDate,
// //     required this.selectedEndDate,
// //     required this.onStartDateChanged,
// //     required this.onEndDateChanged,
// //     required this.entryTitleController,
// //     required this.entrySloganController,
// //     required this.onSave,
// //     required this.onNext,
// //     required this.onCancel,
// //   }) : super(key: key);

// //   @override
// //   _EntryDetailsFormState createState() => _EntryDetailsFormState();
// // }

// // class _EntryDetailsFormState extends State<EntryDetailsForm> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Form(
// //       key: widget.formKey,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           TextFormField(
// //             controller: widget.entryNameController,
// //             decoration: const InputDecoration(labelText: 'Entry Name'),
// //             validator: (value) {
// //               if (value == null || value.isEmpty) {
// //                 return 'Please enter entry name';
// //               }
// //               return null;
// //             },
// //           ),
// //           TextFormField(
// //             controller: widget.entryNumberController,
// //             decoration: const InputDecoration(labelText: 'Entry Number'),
// //             validator: (value) {
// //               if (value == null || value.isEmpty) {
// //                 return 'Please enter entry number';
// //               }
// //               return null;
// //             },
// //           ),
// //           TextFormField(
// //             controller: widget.entryStrengthController,
// //             decoration: const InputDecoration(labelText: 'Entry Strength'),
// //             keyboardType: TextInputType.number,
// //             validator: (value) {
// //               if (value == null || value.isEmpty) {
// //                 return 'Please enter entry strength';
// //               }
// //               if (int.tryParse(value) == null) {
// //                 return 'Please enter a valid number';
// //               }
// //               return null;
// //             },
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               // Show the date picker for start date
// //               showDatePicker(
// //                 context: context,
// //                 initialDate: DateTime.now(),
// //                 firstDate: DateTime(1900),
// //                 lastDate: DateTime.now(),
// //               ).then((date) {
// //                 if (date != null) {
// //                   widget.onStartDateChanged(date);
// //                 }
// //               });
// //             },
// //             child: Text(
// //               widget.selectedStartDate != null
// //                   ? '${widget.selectedStartDate!.toLocal()}'
// //                   : 'Select Start Date',
// //             ),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               // Show the date picker for end date
// //               showDatePicker(
// //                 context: context,
// //                 initialDate: DateTime.now(),
// //                 firstDate: DateTime(1900),
// //                 lastDate: DateTime.now(),
// //               ).then((date) {
// //                 if (date != null) {
// //                   widget.onEndDateChanged(date);
// //                 }
// //               });
// //             },
// //             child: Text(
// //               widget.selectedEndDate != null
// //                   ? '${widget.selectedEndDate!.toLocal()}'
// //                   : 'Select End Date',
// //             ),
// //           ),
// //           TextFormField(
// //             controller: widget.entryTitleController,
// //             decoration:
// //                 const InputDecoration(labelText: 'Entry Title (Optional)'),
// //           ),
// //           TextFormField(
// //             controller: widget.entrySloganController,
// //             decoration:
// //                 const InputDecoration(labelText: 'Entry Slogan (Optional)'),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.symmetric(vertical: 16.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 ElevatedButton(
// //                   onPressed: widget.onCancel,
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.red,
// //                   ),
// //                   child: const Icon(Icons.cancel),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: widget.onSave,
// //                   child: const Text('Save'),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: widget.onNext,
// //                   child: const Text('Next'),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
