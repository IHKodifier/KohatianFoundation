import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CreateEntryStep2 extends ConsumerStatefulWidget {
  const CreateEntryStep2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEntryStep2State();
}

class _CreateEntryStep2State extends ConsumerState<CreateEntryStep2> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Step 2 content here'),
      Text('Step 2 one more content here'),
    ],
      
    );
  }
}
