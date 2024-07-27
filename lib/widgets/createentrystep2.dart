import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CreateEntryStep2 extends ConsumerStatefulWidget {
  const CreateEntryStep2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEntryStep2State();
}

class _CreateEntryStep2State extends ConsumerState<CreateEntryStep2> {
  late Entry? entry;
  late EntryCreationNotifier entryNotifier;
  @override
  Widget build(BuildContext context) {
    entry = ref.watch(entryCreationProvider).entry;
    entryNotifier = ref.read(entryCreationProvider.notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                 Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Create Cadets'),
                        ),
                        SizedBox(height: 16),
                        Text(
                            '${entry!.strength.toString()} blank Cadet Profiles will be created'),
                      ],
                    ),
                  ),
                ),
               
              ],
            ),
       SizedBox(width: 40),
            //Dropzone
            Card(
              // shape:
              elevation: 5,
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: DropzoneWidget(),
                ),
              ),
              ),
            
          ],
        ),
      ],
    );
  }
}
