import 'package:kohatian_foundation/widget_export.dart';

class DbService {
  Future<void> saveEntryToFirestore(Entry newEntry) async {
    try {
      await FirebaseFirestore.instance
          .collection('entrys')
          .doc(newEntry.name)
          .set(newEntry.toMap());
    } catch (e) {
      print(e);
    }
  }
  Future<void> saveCadetToFirestore(
      String entryName, List<Cadet?> cadets) async {
    try {
      final batch = FirebaseFirestore.instance.batch();

      for (final cadet in cadets) {
        batch.set(
          FirebaseFirestore.instance
              .collection('entrys')
              .doc(entryName)
              .collection('cadets')
              .doc(cadet?.kitNo.toString()),
          cadet?.toMap(),
        );
      }

      await batch.commit();
      print('Cadets written to Firestore');
    } catch (e) {
      print(e);
    }
  }

}
