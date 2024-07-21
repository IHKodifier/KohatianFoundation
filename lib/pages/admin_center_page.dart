import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class AdminCenterPage extends StatefulWidget {
  const AdminCenterPage({Key? key}) : super(key: key);

  @override
  _AdminCenterPageState createState() => _AdminCenterPageState();
}

class _AdminCenterPageState extends State<AdminCenterPage> {
  final GlobalKey<FormState> formKeyEntryDetails = GlobalKey<FormState>();
  final TextEditingController entryNameController = TextEditingController();
  final TextEditingController entryNumberController = TextEditingController();
  final TextEditingController entryStrengthController = TextEditingController();
  final TextEditingController entryTitleController = TextEditingController();
  final TextEditingController entrySloganController = TextEditingController();

  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  @override
  void dispose() {
    entryNameController.dispose();
    entryNumberController.dispose();
    entryStrengthController.dispose();
    entryTitleController.dispose();
    entrySloganController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Center'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          AdminCenterCore(
            formKeyEntryDetails: formKeyEntryDetails,
            entryNameController: entryNameController,
            entryNumberController: entryNumberController,
            entryStrengthController: entryStrengthController,
            selectedStartDate: selectedStartDate,
            selectedEndDate: selectedEndDate,
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
            entryTitleController: entryTitleController,
            entrySloganController: entrySloganController,
            onSave: () {
              // Implement save logic here
              if (formKeyEntryDetails.currentState!.validate()) {
                // Save entry data to Firestore or your desired data store
                // ...
              }
            },
            onNext: () {
              // Implement next action logic here
              // ...
            },
            onCancel: () {
              // Implement cancel action logic here
              // ...
            },
          ),
        ],
      ),
    );
  }
}
