import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/pages/sign-in_page.dart';
import 'package:kohatian_foundation/services/providers/flexscheme_provider.dart';
import 'package:kohatian_foundation/widget_export.dart';

class UserPreviewSmall extends ConsumerWidget {
  final UserProfile data;
  const UserPreviewSmall(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 5,

      // color: Colors.white,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          profilePic(),
          kitNumberText(context), // Display Kit Number
          cadetName(context), // Display Name
          cadetHouse(context),
          ThemesTile(),
          const SizedBox(height: 10),
          ThemeModeTile(themeNotifier: ref.read(themeModeProvider.notifier)),
          accountTile(data, context),
          accountTypeTile( data, context),
        ],
      )),
    );
  }

  Padding profilePic() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CircleAvatar(
        radius: 58,
        backgroundColor: const Color.fromARGB(255, 4, 45, 92),
        backgroundImage: data.profileImageUrl.isNotEmpty
            ? NetworkImage(data.profileImageUrl)
            : const AssetImage('assets/images/mo_user_avatar.png'),
      ),
    );
  }

  Text kitNumberText(BuildContext context) {
    return Text(data.kitNo.toString(),
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Theme.of(context).colorScheme.tertiary));
  }

  Text cadetName(BuildContext context) {
    return Text(
      data.name,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: Theme.of(context).colorScheme.primary),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text cadetHouse(BuildContext context) {
    String houseName = '';
    switch (data.house) {
      case 'JH':
        houseName = 'Jinnah House';
        break;
      case 'KH':
        houseName = 'Khushal House';
        break;
      case 'IH':
        houseName = 'Iqbal House';
        break;
      case 'AH':
        houseName = 'Ayub House';
        break;
      case 'MH':
        houseName = 'Munawar House';
        break;
      case 'RH':
        houseName = 'Rustam House';
        break;
      default:
        houseName = data.house;
    }
    return Text(houseName,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Theme.of(context).colorScheme.tertiary));
  }

  Padding accountTile(UserProfile? data, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        // color: Colors.blueGrey.shade50,
        elevation: 5,
        child: ListTile(
          leading: const Icon(Icons.person, size: 40),

          title: const Text('Account '),
          subtitle: Text(data!.email),
          // enabled: true,
          trailing: TextButton(
            onPressed: () {
              //TODO
              // Sign out the user
              FirebaseAuth.instance.signOut();

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SignInPage()));
            },
            child: Text(
              'SIGN OUT',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Padding accountTypeTile(UserProfile? data, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Card(
            elevation: 5,
            child: ListTile(
                leading: const Icon(Icons.person, size: 40),
                title: const Text('Account  Type'),
                subtitle: Row(
                  children: data?.roles
                          .map(
                            (e) => Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.secondary,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Text(
                                        e.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary),
                                      ),
                                    )),
                              ),
                            ),
                          )
                          .toList() ??
                      [const SizedBox()],
                ),
                trailing: (data?.roles.contains(UserRole.admin()) ?? false)
                    ? // Check for Admin Role
                    SizedBox(
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          //TODO
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdminCenterPage(),
                          ));
                        },
                        child: Text(
                          'Admin Center',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                // color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    )
                    : SizedBox.shrink())));

    //   ),
    // );
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
  ThemeModeNotifier themeNotifier;

  ThemeModeTile({super.key, required this.themeNotifier});

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
      onChanged: onChanged,
      title: Text(
        'Dark Mode',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
