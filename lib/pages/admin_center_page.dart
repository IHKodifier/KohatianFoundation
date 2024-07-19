import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class AdminCenterPage extends StatelessWidget {
  const AdminCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Center'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
        
          AdminCenterCore(),
        ],
      ),
    );
  }
}
