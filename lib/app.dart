import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/services/providers/flexscheme_provider.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/start_up.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScheme = ref.watch(flexSchemeProvider);
 
    return MaterialApp(
      title: 'Kohatian Foundation',
      debugShowCheckedModeBanner: false,
      theme: FlexColorScheme.light(scheme: currentScheme).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: currentScheme).toTheme,
      themeMode: ref.watch(themeModeProvider),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => StartUp(), // Your initial page
        '/signup': (context) => SignupPage(
            kitNo: ModalRoute.of(context)!.settings.arguments
                as String?), // Define the signup route
      },
    builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
             const Breakpoint(start: 0, end: 450, name: 'not supported'),
             const Breakpoint(start: 451, end: 800, name: MOBILE),
          const Breakpoint(start: 801, end: 1200, name: TABLET),
          const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],),
    );
  }
}
