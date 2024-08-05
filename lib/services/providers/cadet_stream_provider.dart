// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kohatian_foundation/widget_export.dart';
// import './models/cadet_model.dart'; // Assuming you have a Cadet model

final cadetStreamProvider = StreamProvider.family<List<Cadet>, String>(
  (ref, entryName) {
    final cadetsCollection = FirebaseFirestore.instance
        .collection('entrys')
        .doc(entryName)
        .collection('cadets');

    return cadetsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Cadet.fromMap(doc.data())).toList();
    });
  },
);
