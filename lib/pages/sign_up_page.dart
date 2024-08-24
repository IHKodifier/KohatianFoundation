import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class SignupPage extends ConsumerWidget {
  final String? kitNo;
  const SignupPage({this.kitNo, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Card(
            elevation: 10,
            child: SingleChildScrollView(
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SignUp',
                  style: Theme.of(context).textTheme.displaySmall),
                  SignupForm(
                    kitNoParam: kitNo, 
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
