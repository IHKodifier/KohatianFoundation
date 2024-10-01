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

  Future<Cadet> getCadetFromFirestore(String entryName, String kitNo) async {
    try {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection('entrys')
          .doc(entryName)
          .collection('cadets')
          .doc(kitNo)
          .get();

      if (documentSnapshot.exists) {
        // Create a Cadet object from the document data
        return Cadet.fromMap(documentSnapshot.data()!);
      } else {
        // Handle the case where the document doesn't exist
        throw Exception('Cadet not found with kit number: $kitNo');
      }
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error fetching cadet: $e');
      rethrow; // Rethrow the exception to be handled by the caller
    }
  }
}
