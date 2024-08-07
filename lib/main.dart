import 'package:flutter/material.dart';
import 'package:kohatian_foundation/services/widget_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




//pointless git commit to attemp GIS
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}


