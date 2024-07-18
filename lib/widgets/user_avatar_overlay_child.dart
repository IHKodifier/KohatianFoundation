import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class UserAvatarOverlayVhild extends ConsumerWidget {
  
  const UserAvatarOverlayVhild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
       final profile = ref.watch(userProfileProvider);
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
                Text(data!.kitNo),
                Text(data!.name),
                Text(data!.house),
                data.roles.contains(UserRole.admin())
                    ? TextButton.icon(
                        onPressed: () {},
                        label: Text('Admin center'),
                        iconAlignment: IconAlignment.end,
                        icon: Icon(Icons.launch),
                      )
                    : Container(),
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
