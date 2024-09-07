import 'package:flutter/material.dart';
import 'package:kohatian_foundation/pages/create_entry_page.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/admin_center_tile.dart';
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
    final maxWidth = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Container(
            width: maxWidth - 128,
            // height: 600 ,
            // color: Colors.pink,
            child: Column(
              children: [

                ResponsiveRowColumn( //Dashboard
                  layout:
                      ResponsiveBreakpoints.of(context).largerOrEqualTo(TABLET)
                          ? ResponsiveRowColumnType.ROW
                          : ResponsiveRowColumnType.COLUMN,
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveRowColumnItem(
                        child: adminDashboardCard(context, maxWidth)),
                  ],
                ),

                ResponsiveRowColumn( //Entry and Entry Coordinstors Tile
                  layout:
                      ResponsiveBreakpoints.of(context).largerOrEqualTo(TABLET)
                          ? ResponsiveRowColumnType.ROW
                          : ResponsiveRowColumnType.COLUMN,
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  rowSpacing: 16,
                  children: [
                    ResponsiveRowColumnItem(
                      child: AdminCenterTile(
                        maxWidth: maxWidth,
                        routeTarget: CreateEntryPage(),
                        title: 'Entrys',
                        subtitle: 'Create / update Edit Entrys....',
                        icon: Icon(
                          Icons.diversity_2_outlined,
                          size: 60,
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: AdminCenterTile(
                        maxWidth: maxWidth,
                        routeTarget: UserHomePage(),
                        title: 'Entry Coordinators',
                        subtitle: 'Set up Entry Coordinators....',
                        icon: Icon(
                          Icons.precision_manufacturing,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                
                ResponsiveRowColumn( // settings and About 
                    layout: ResponsiveBreakpoints.of(context)
                            .largerOrEqualTo(TABLET)
                        ? ResponsiveRowColumnType.ROW
                        : ResponsiveRowColumnType.COLUMN,
                    rowCrossAxisAlignment: CrossAxisAlignment.center,
                    rowMainAxisAlignment: MainAxisAlignment.center,
                    rowSpacing: 16,
                    children: [
                      ResponsiveRowColumnItem(
                        child: AdminCenterTile(
                          maxWidth: maxWidth,
                          routeTarget: UserHomePage(),
                          title: 'settings',
                          subtitle: 'application / user settings',
                          icon: Icon(
                            Icons.settings,
                            size: 60,
                          ),
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: AdminCenterTile(
                          maxWidth: maxWidth,
                          routeTarget: UserHomePage(),
                          title: 'About ',
                          subtitle: 'Reserved for Future Functionality....',
                          icon: Icon(
                            Icons.precision_manufacturing,
                            size: 60,
                          ),
                        ),
                      ),
                    ]),
                //  Respon
              ],
            ),
          ),
        ),
       
      ),
    );
  }
  // Widget itemBuilder(BuildContext context, int index) {
  //   var gridChildren = <Widget>[];
  //   gridChildren = [
  //     Container(height: 100,width: 100,color: Colors.red ),
  //     Container(height: 100,width: 100,color: Colors.red ),
  //   // createEntryCard(context),
  //   // createEntryCoordinatorCard(context),
  //   // otherSettingsCard(context),
  //   ];
  //   return gridChildren[index];
  // }

  // Existing methods for card creation (unchanged)

  Widget createEntryCard(BuildContext context, double maxWidth) {
    return Container(
      width: maxWidth * 0.3,
      height: 150,
      child: InkWell(
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
      ),
    );
  }

  Widget createEntryCoordinatorCard(BuildContext context, double maxWidth) {
    return Container(
      width: maxWidth * 0.3,
      height: 150,
      child: InkWell(
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
                      const Icon(
                        Icons.precision_manufacturing,
                        size: 60,
                        //color: Colors.black54,
                      ),
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
                                    // fontWeight: FontWeight.w600,
                                    // color: Colors.black,
                                    ),
                          ),
                          Text(
                            'Set up  Entry Coordinators....',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  // color: Colors.black54,
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
      ),
    );
  }

  InkWell createEntryContent(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CreateEntryPage(), // New screen for Entry creation
          ),
        );
      },
      child: Row(
        children: [
          const Spacer(flex: 8),
          const Icon(
            Icons.diversity_2, size: 60,
            // color: Colors.black54,
          ),
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
                      // fontWeight: FontWeight.w600,
                      // color: Colors.black,
                      ),
                ),
                Text(
                  'Create/Update/ Manage Entrys....',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        // fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        // color: Colors.black54,
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
                    const Icon(
                      Icons.settings, size: 60,
                      //  color: Colors.black54,
                    ),
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
                                  // fontWeight: FontWeight.w600,
                                  // color: Colors.black,
                                  ),
                        ),
                        Text(
                          'Manage other settings....',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    // fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    // color: Colors.black54,
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

  Widget adminDashboardCard(BuildContext context, double maxWidth) {
    return Card(
      elevation: 0.5,
      child: Container(
        height: 400,
        color: Theme.of(context).colorScheme.secondaryContainer,
        width: maxWidth * 0.8,
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
                    const Icon(
                      Icons.dashboard,
                      size: 60,
                      // color: Colors.black54,
                    ),
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
                                  // fontWeight: FontWeight.w600,
                                  // color: Colors.black,
                                  ),
                        ),
                        Text(
                          'View overall statistics and reports....',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    // fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    // color: Colors.black54,
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
        ),
      ), // ... your Entry creation content
    );
  }

  //
}
