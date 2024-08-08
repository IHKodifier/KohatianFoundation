import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/services/providers/flexscheme_provider.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/start_up.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScheme = ref.watch(flexSchemeProvider);
     final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      title: 'Kohatian Foundation',
      debugShowCheckedModeBanner: false,
      
      
      
    // Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
      theme: FlexColorScheme.light(scheme: currentScheme).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: currentScheme).toTheme,
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
themeMode: themeMode,

      home: Material(child: StartUp()),
    );
  }
}
