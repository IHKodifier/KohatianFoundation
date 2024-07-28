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
}
