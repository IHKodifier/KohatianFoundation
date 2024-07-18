import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class UserAvatarOverlayChild extends ConsumerStatefulWidget {
  const UserAvatarOverlayChild({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserAvatarOverlayChildState();
}

class _UserAvatarOverlayChildState
    extends ConsumerState<UserAvatarOverlayChild> with SingleTickerProviderStateMixin {
   late AnimationController _animationController;
  late Animation<double> _animation;
 
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      // animationBehavior: AnimationBehavior.preserve
    );
    // Modified line:
    _animation =
        Tween<double>(begin: 200, end: 250).animate(CurvedAnimation(
          parent: _animationController,
          // parent: _animationController,
          curve: Curves.easeInQuad,
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
    final profile = ref.watch(userProfileProvider);
   
    return Positioned(
      top: 50,
      right: 120,
      child: profile.when(
        data: (data) => AnimatedBuilder(
          animation: _animation,
          // duration: Durations.medium1,
          builder: (context, child) => SizedBox(
            // Modified lines:
            width: _animation.value*1.5, // Directly use animation value for width
            height: _animation.value, // Directly use animation value for height
            child: child,
          ),
          child: Card(
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
        ),
        error: (error, stackTrace) =>
            Text(error.toString() + stackTrace.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
