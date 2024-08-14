import 'package:flutter/material.dart';
import 'package:kohatian_foundation/widget_export.dart';

class CadetGridTile extends StatelessWidget {
  const CadetGridTile({super.key, required this.cadet});

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
        // color: Colors.blueGrey.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              cadetAvatar(context),
              const SizedBox(height: 8),
              kitNo(),
              const SizedBox(height: 12),
              name(),
              const SizedBox(height: 8),
              house(houseName),
              const SizedBox(height: 4),
              domicile(),
              const SizedBox(height: 4),
              mobileNumber(),
              const SizedBox(height: 12),
              signupButton(context),
            ],
          ),
        ),
      ),
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

  CircleAvatar cadetAvatar(BuildContext context) {
    return CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              radius: 40,
              backgroundImage: cadet.hasSignedUp == false
                  ? const AssetImage('assets/images/no_user_avatar.png')
                  : NetworkImage(cadet.profileImageUrl!),
            );
  }

  Widget mobileNumber() => cadet.hasSignedUp?Text(cadet.mobileNumber):Container();

  Widget domicile() => cadet.hasSignedUp?Text(' ${cadet.domicile}'):Container();

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
              Navigator.pushNamed(context, '/signup', arguments: cadet.kitNo);
            },
            child: Text('Signup as ${cadet.kitNo}'))
        : Container();
  }
}
