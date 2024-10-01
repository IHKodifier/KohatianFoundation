import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/pages/sign-in_page.dart';
import 'package:kohatian_foundation/services/providers/flexscheme_provider.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:kohatian_foundation/widgets/user_preview_small.dart';

class UserAvatarOverlayChild extends ConsumerStatefulWidget {
  const UserAvatarOverlayChild({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserAvatarOverlayChildState();
}

class _UserAvatarOverlayChildState extends ConsumerState<UserAvatarOverlayChild>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 450),
      vsync: this,
      // animationBehavior: AnimationBehavior.preserve
    );
    // Modified line:
    _animation = Tween<double>(begin: 200, end: 300).animate(CurvedAnimation(
      parent: _animationController,
      // parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(userProfileProvider(
        ref.read(authServiceProvider).getCurrentUser()!.email!));

    return Positioned(
      top: 50,
      right: 120,
      child: profile.when(
        data: (data) => AnimatedBuilder(
          animation: _animation,
          // duration: Durations.medium1,
          builder: (context, child) => SizedBox(
            // Modified lines:
            height:500,
            width: _animation.value *
                1.5, // Directly use animation value for width
            // height: _animation.value, // Directly use animation value for height
            child: child,
          ),
          child: UserPreviewSmall(data!),
        ),
        error: (error, stackTrace) =>
            Text(error.toString() + stackTrace.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }




}

class ThemesTile extends ConsumerWidget {
  ThemesTile({
    super.key,
  });
  late WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    this.ref = ref;
    return ListTile(
      onTap: () {
        showDialog(context: context, builder: themesDialogBuilder);
      },
      leading: Icon(
        (Icons.color_lens),
        color: Theme.of(context).colorScheme.primary,
        // size: 40,
      ),
      title: Text(
        'Themes',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget themesDialogBuilder(BuildContext context) {
    final currentScheme = ref.watch(flexSchemeProvider);
    bool isLoading = false;

    return Stack(
      children: [
        SimpleDialog(
          title: const Text('Choose Theme'),
          insetPadding: const EdgeInsets.all(8),
          children: FlexScheme.values
              .map(
                (e) => ListTile(
                  title: Text(e.name),
                  trailing: currentScheme == e ? const Icon(Icons.check) : null,
                  onTap: () async {
                    Navigator.pop(context);
                    isLoading = true;
                    ref.read(flexSchemeProvider.notifier).changeScheme(e);
                    await Future.delayed(const Duration(milliseconds: 5000));
                  },
                ),
              )
              .toList(),
        ),
        // LoadingOverlay(isLoading: isLoading),
      ],
    );
  }
}

class ThemeModeTile extends ConsumerWidget {
  var themeNotifier;

  ThemeModeTile({super.key});

  void onChanged(bool value) {
    if (value == true) {
      themeNotifier.applyDarkTheme();
    } else {
      themeNotifier.applyLightTheme();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    themeNotifier = ref.read(themeModeProvider.notifier);
    return SwitchListTile(
      value: themeMode == ThemeMode.dark,
      secondary: Icon(
        (Icons.dark_mode),
        color: Theme.of(context).colorScheme.primary,
        // size: 40,
      ),
      onChanged: (value) {
        onChanged(value);
      },
      title: Text(
        'Dark Mode',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      // trailing:
      //     Switch(value: themeMode == ThemeMode.dark, onChanged: onChanged),
    );
  }
}
