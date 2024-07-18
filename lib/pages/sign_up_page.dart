import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SignupForm(),
    );
  }
}
