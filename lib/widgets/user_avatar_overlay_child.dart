import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class UserAvatarOverlayVhild extends ConsumerWidget {
  const UserAvatarOverlayVhild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);
    //  final user = ref.watch(prov);
    return Positioned(
      top: 50,
      right: 120,
      child: AnimatedContainer(
        duration: Durations.long4,
        height: 250,
        width: 250,
        child: profile.when(
          data: (data) => Card(
            elevation: 15,
            color: Colors.white,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Cadet ID: ${data!.kitNo}'), // Display Kit Number as Cadet ID
                Text('Name: ${data.name}'), // Display Name
                Text('House: ${data.house}'), // Display House
                if (data.roles
                    .contains(UserRole.admin())) // Check for Admin Role
                  TextButton.icon(
                    onPressed: () {},
                    label: Text('Admin Center'),
                    iconAlignment: IconAlignment.end,
                    icon: Icon(Icons.launch),
                  ),
              ],
            )),
          ),
          error: (error, stackTrace) =>
              Text(error.toString() + stackTrace.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
