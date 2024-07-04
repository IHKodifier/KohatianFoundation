import 'package:kohatian_foundation/widget-export.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        height: 120,
        width: double.infinity,
        color: Colors.green,
        child: Center(
            child: Wrap(
          runSpacing: 10,
          spacing: 150,
          children: [
            TextButton(child: Text('Vision'), onPressed: () {}),

            TextButton(child: Text('Mission'), onPressed: () {}),

            TextButton(child: Text('Function'), onPressed: () {}),

            TextButton(child: Text('Pearls of CCK'), onPressed: () {}),

            // Text('AppBar'),
          ],
        )),
      ),
    );
  }
}
