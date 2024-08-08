import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class FlexSchemeController extends StateNotifier<FlexScheme> {
  FlexSchemeController() : super(FlexScheme.material);

  void changeScheme(FlexScheme newScheme) {
    state = newScheme;
    state = state;
  }
}

final flexSchemeProvider =
    StateNotifierProvider<FlexSchemeController, FlexScheme>((ref) {
  return FlexSchemeController();
});


class ThemesList extends ConsumerWidget {
  const ThemesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScheme = ref.watch(flexSchemeProvider);
   
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: FlexScheme.values.length,
          itemBuilder: (context, index) {
            final scheme = FlexScheme.values[index];
            return ListTile(
              title: Text(scheme.name),
              trailing:
                  currentScheme == scheme ? const Icon(Icons.check) : null,
              onTap: () =>
                  ref.read(flexSchemeProvider.notifier).changeScheme(scheme),
            );
          },
        ),
      ),
    );
  }
}
final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier(ThemeMode.light);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier(super.state);

  void applyDarkTheme() {
    state = ThemeMode.dark;
  }

  void applyLightTheme() {
    state = ThemeMode.light;
  }
}

