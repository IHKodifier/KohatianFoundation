import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId:
        '239392991522-arev04me39i54824423japuftoon0goc.apps.googleusercontent.com',
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      overrides: [
      googleSignInProvider.overrideWithValue(_googleSignIn),
      ],
      child: const MyApp()));
}
