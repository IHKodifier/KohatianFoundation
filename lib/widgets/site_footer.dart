

import 'package:kohatian_foundation/widget_export.dart';

class SiteFooter extends ConsumerWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        color: Theme.of(context).dividerColor,
        height: 200,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Site Footer goes here'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}