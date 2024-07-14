import 'package:kohatian_foundation/widget_export.dart';

class UserFeedWidget extends ConsumerWidget {
  const UserFeedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        height: 800, 
        color: Colors.yellow,
        child: const Center(
          child: Text('User Feed'),
        ),  
      ),
    );
  }
}
