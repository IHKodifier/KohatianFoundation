import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SignupPage extends ConsumerWidget {
  final String? kitNo;
  const SignupPage({this.kitNo, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
             SignupForm(kitNo: kitNo,),
          ],
        ),
      ),
    );
  }
}
