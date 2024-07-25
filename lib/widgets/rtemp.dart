// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:openxl/openxl.dart' as openxl;

// class EntryDetails extends StatefulWidget {
//   final TextEditingController entryStengthController;

//   const EntryDetails({Key? key, required this.entryStengthController})
//       : super(key: key);

//   @override
//   State<EntryDetails> createState() => _EntryDetailsState();
// }

// class _EntryDetailsState extends State<EntryDetails> {
//   List<Map<String, String>> cadets = []; // Store parsed cadet data

//   Future<void> createBlankCadets(int count) async {
//     final db = FirebaseFirestore.instance;
//     final entryId = 'entryid'; // Replace with actual entry ID

//     for (int i = 0; i < count; i++) {
//       await db.collection('entrys').doc(entryId).collection('cadets').add({
//         'kitno': '',
//         'name': '',
//         'domicile': '',
//         'house': '',
//         'mobilenumber': '',
//       });
//     }
//   }

//   Future<void> parseAndUploadCadets(PlatformFile file) async {
//     final db = FirebaseFirestore.instance;
//     final entryId = 'entryid'; // Replace with actual entry ID

//     final bytes = await file.readAsBytes();
//     final excel = openxl.Excel();
//     await excel.decodeBytes(bytes);

//     final sheet = excel.sheetAt(0); // Assuming data is in the first sheet
//     final rowCount = sheet.maxRowCount;

//     if (rowCount > 1) { // Skip header row
//       for (int row = 2; row <= rowCount; row++) {
//         final kitno = sheet.cell(row, 1).value.toString();
//         final name = sheet.cell(row, 2).value.toString();
//         final domicile = sheet.cell(row, 3).value.toString();
//         final house = sheet.cell(row, 4).value.toString();
//         final mobilenumber = sheet.cell(row, 5).value.toString();

//         await db
//             .collection('entrys')
//             .doc(entryId)
//             .collection('cadets')
//             .add({
//           'kitno': kitno,
//           'name': name,
//           'domicile': domicile,
//           'house': house,
//           'mobilenumber': mobilenumber,
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return screenWidth < 800
//         ? Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   final count = int.tryParse(widget.entryStengthController.text) ?? 0;
//                   await createBlankCadets(count);
//                 },
//                 child: Text(
//                   'Create ${widget.entryStengthController.text} Blank Cadets',
//                 ),
//               ),
//               DragTarget<PlatformFile>(
//                 onWillAccept: (_) => true,
//                 onAccept: (file) async {
//                   await parseAndUploadCadets(file);
//                 },
//                 builder: (context, candidateData, rejectedData) {
//                   return Container(
//                     height: 100,
//                     color: Colors.grey.withOpacity(0.2),
//                     child: Center(
//                       child: Text(
//                         'Drop .xlsx file here to upload cadets',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           )
//         : Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     final count = int.tryParse(widget.entryStengthController.text) ?? 0;
//                     await createBlankCadets(count);
//                   },
//                   child: Text(
//                     'Create ${widget.entryStengthController.text} Blank Cadets',
//                   ),
//                 ),
//               ),
//               SizedBox(width: 20),
//               Expanded(
//                 child: DragTarget<PlatformFile>(
//                   onWillAccept: (_) => true,
//                   onAccept: (file) async
