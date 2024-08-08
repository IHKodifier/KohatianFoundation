import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CadetGridTile extends StatelessWidget {
  const CadetGridTile({Key? key, required this.cadet}) : super(key: key);

  final Cadet cadet;

  @override
  Widget build(BuildContext context) {
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
    return Expanded(
      child: Card(
        elevation: 12,
        color: Colors.blueGrey.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                // backgroundColor: Colors.black,
                radius: 40,
                backgroundImage: cadet.hasSignedUp == false
                    ? AssetImage('assets/images/no_user_avatar.png')
                    : NetworkImage(cadet.profileImageUrl!),
              ),
              Text(
                cadet.kitNo,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                cadet.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(houseName),
              const SizedBox(height: 4),
              Text('Domicile: ${cadet.domicile}'),
              const SizedBox(height: 4),
              Text('Phone: ${cadet.mobileNumber}'),
              const SizedBox(height: 12),
              cadet.hasSignedUp != true
                  ? ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign Up as ${cadet.kitNo}'))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
