import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
     
      body: Center(child: const SignInForm()),
    );
  }
}