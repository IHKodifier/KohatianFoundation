import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/create_entry_stepper.dart';

// ... other imports

class AdminCenterCore extends ConsumerStatefulWidget {
  final GlobalKey<FormState> formKeyEntryDetails;
  
  final TextEditingController entryNameController;
  final TextEditingController entryNumberController;
  final TextEditingController entryStrengthController;

  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;

  final Function(DateTime) onStartDateChanged;
  final Function(DateTime) onEndDateChanged;
  final TextEditingController entryTitleController;
  final TextEditingController entrySloganController;
  final VoidCallback onSave;
  final VoidCallback onNext;
  final VoidCallback onCancel;

  AdminCenterCore({
    super.key,
    required this.formKeyEntryDetails,
    required this.entryNameController,
    required this.entryNumberController,
    required this.entryStrengthController,
    this.selectedStartDate,
    this.selectedEndDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.entryTitleController,
    required this.entrySloganController,
    required this.onSave,
    required this.onNext,
    required this.onCancel,
  });

  @override
  ConsumerState<AdminCenterCore> createState() => _AdminCenterCoreState();
}

class _AdminCenterCoreState extends ConsumerState<AdminCenterCore> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Material(
        child: Container(
          margin: const EdgeInsets.only(top: 16.0),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Card for Admin Dashboard
              adminDashboardCard(context),
              const SizedBox(height: 16.0),
      
              // Card for Entry model creation
              createEntryCard(context),
              const SizedBox(height: 16.0),
      
              // Card for EntryCoordinator settings
              createEntryCoordinatorCard(context),
              const SizedBox(height: 16.0),
      
              // Card for other settings
              otherSettingsCard(context),
            ],
          ),
        ),
      ),
    );
  }

  // Existing methods for card creation (unchanged)

  InkWell createEntryCard(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createEntryContent(context),
            ),
          ],
        ),
        //TODO  Entry creation content
      ),
    );
  }

  InkWell createEntryCoordinatorCard(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                //TODO
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const Spacer(flex: 8),
                    const Icon(Icons.precision_manufacturing,
                        size: 60, color: Colors.black54),
                    const Spacer(flex: 1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Entry cordinators',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                        ),
                        Text(
                          'Set uup  Entry Coordins=ators....',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    // fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black54,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 8),
                  ],
                ),
              ),
            ),
          ],
        ), // ... your Entry creation content
      ),
    );
  }

  InkWell createEntryContent(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO
        showDialog(
          context: context,
          builder: (_) => Dialog(
            child: Container(
              padding: EdgeInsets.all(16),
              width:500,child: Column(
                children: [
                  Text('Entry details',
                  style: Theme.of(context).textTheme.headlineLarge,),
                  CreateEntryStepper(),
                ],
              )),
           
          ),
        );
      },
      child: Row(
        children: [
          const Spacer(flex: 8),
          const Icon(Icons.diversity_2, size: 60, color: Colors.black54),
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Entrys',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                Text(
                  'Create/Update/ Manage Entrys....',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        // fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                      ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 8),
        ],
      ),
    );
  }

  InkWell otherSettingsCard(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                //TODO
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const Spacer(flex: 8),
                    const Icon(Icons.settings, size: 60, color: Colors.black54),
                    const Spacer(flex: 1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Other Settings',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                        ),
                        Text(
                          'Manage other settings....',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    // fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black54,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 8),
                  ],
                ),
              ),
            ),
          ],
        ), // ... your Entry creation content
      ),
    );
  }

  InkWell adminDashboardCard(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                //TODO
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const Spacer(flex: 8),
                    const Icon(Icons.dashboard,
                        size: 60, color: Colors.black54),
                    const Spacer(flex: 1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Admin Dashboard',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                        ),
                        Text(
                          'View overall statistics and reports....',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    // fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black54,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 8),
                  ],
                ),
              ),
            ),
          ],
        ), // ... your Entry creation content
      ),
    );
  }

  //   return InkWell(
  //     onTap: () {
  //       //TODO
  //     },
  //     child: Card(
  //       elevation: 5,
  //       child: Column(
  //         children: [
  //           InkWell(
  //             onTap: () {
  //               //TODO
  //             },
  //             child: Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 8.0),
  //               child: Row(
  //                 children: [
  //                   const Spacer(flex: 8),
  //                   const Icon(Icons.dashboard,
  //                       size: 60, color: Colors.black54),
  //                   const Spacer(flex: 1),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         'Admin Dashboard',
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .headlineMedium
  //                             ?.copyWith(
  //                                 fontWeight: FontWeight.w600,
  //                                 color: Colors.black),
  //                       ),
  //                       Text(
  //                         'View overall statistics and reports....',
  //                         style:
  //                             Theme.of(context).textTheme.labelLarge?.copyWith(
  //                                   // fontWeight: FontWeight.w600,
  //                                   fontStyle: FontStyle.italic,
  //                                   color: Colors.black54,
  //                                 ),
  //                       ),
  //                     ],
  //                   ),
  //                   const Spacer(flex: 8),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ), // ... your Entry creation content
  //     ),
  //   );
  // }
}
