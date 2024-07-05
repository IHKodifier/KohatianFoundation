import 'package:kohatian_foundation/widget-export.dart';

class BannerImage extends ConsumerWidget {
  const BannerImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
          width: double.infinity,
          height: 600,
          color: Colors.deepOrange,
          child: Center(child: Text('Banner Image'))),
    );
  }
}
