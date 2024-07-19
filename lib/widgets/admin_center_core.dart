import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ... other imports

class AdminCenterCore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 16.0),
        // color: Colors.yellow,
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
            // const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

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
}
