import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CadetGridTile extends ConsumerWidget {
  const CadetGridTile(
      {required this.index, super.key, required this.cadet, required this.maxWidth});

  final Cadet cadet;
  final int index;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = ref.watch(hoverProvider) == index;
    String houseName = cadet.house;
    final hasSignedUp = cadet.hasSignedUp;

    switch (cadet.house) {
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
        houseName = cadet.house;
    }
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(currentCadetProvider.notifier)
                      .setCurrentCadet(cadet);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CadetProfilePage(),
                  ));
                },
                child: Card(
                  elevation: 12,
                  // color: Colors.blueGrey.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        cadetAvatar(context),
                        const SizedBox(height: 2),
                        kitNo(),
                        // const SizedBox(height: 2),
                        name(),
                        const SizedBox(height: 2), 
                        house(houseName),
                        const SizedBox(height: 2),
                        // domicile(),
                        // const SizedBox(height: 4),
                        mobileNumber(),
                        const SizedBox(height: 2),
                        signupButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        // Show popup only when hovered
        if (isHovered)
          Positioned(
            top: 0,
            left: 10,
            child: Container(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                child: CadetPopupWidget(cadet: cadet,maxWidth: maxWidth,)),
            //one more comment to fix up the git  push issssue.
          ),
      ],
    );
  }

  Text kitNo() {
    return Text(
      cadet.kitNo.toString(),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget cadetAvatar(BuildContext context) {
    return ClipOval(
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        radius: 55,
        backgroundImage: cadet.hasSignedUp == false
            ? const AssetImage('assets/images/no_user_avatar.png')
            : NetworkImage(cadet.profileImageUrl!),
      ),
    );
  }

  Widget mobileNumber() =>
      cadet.hasSignedUp ? Text(cadet.mobileNumber) : Container();

  Widget domicile() =>
      cadet.hasSignedUp ? Text(' ${cadet.domicile}') : Container();

  Text house(String houseName) => Text(houseName);

  Text name() {
    return Text(
      cadet.name,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  signupButton(BuildContext context) {
    return cadet.hasSignedUp != true
        ? ElevatedButton(
            onPressed: () {
              // Navigate to SignupPage and pass the kitNo
              Navigator.pushNamed(context, '/signup',
                  arguments: cadet.kitNo.toString());
            },
            child: Text('Signup as ${cadet.kitNo.toString()}'))
        : Container();
  }
}
