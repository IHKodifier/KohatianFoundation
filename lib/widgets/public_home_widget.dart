import 'package:kohatian_foundation/widget_export.dart';

class PublicHomeWidget extends ConsumerWidget {
  const PublicHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return SliverFillRemaining(
      child: Container(
        color: Colors.blue,
        child: Center(child: Text('Public home')),
      ),
    );
  }
}
