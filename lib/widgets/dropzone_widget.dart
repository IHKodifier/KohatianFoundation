import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../widget_export.dart';

class DropzoneWidget extends ConsumerStatefulWidget {
  const DropzoneWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DropzoneWidgetState();
}

class _DropzoneWidgetState extends ConsumerState<DropzoneWidget> {
  late DropzoneViewController controller;
@override
 


  @override
  Widget build(BuildContext context) {
    // controller= DropzoneViewController().;
    return Container(
      color: Colors.green.shade300,
      child: Center(
        child: Stack(
          children: [
            DropzoneView(
                operation: DragOperation.copy,
                cursor: CursorType.copy,

                onCreated: (controller) => this.controller = controller,
                onDrop: onFileDrop),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.cloudArrowUp,
                    size: 60,
                    color: Colors.white,
                  ),
                  const Text('Drop an Excel file here'),
                  const Text('or'),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton.icon(
                    label: const Text('Choose File'),
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final events = await controller.pickFiles();
                      if (events != null) {
                        // Process the selected files
                        for (final event in events) {
                          final fileName = event.name;
                          print('Selected File: $fileName');
                          // You can access the file path using event.path
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onFileDrop(dynamic event) {
    final fileName = event.name;
    print('FileName : $fileName');
  }
}
