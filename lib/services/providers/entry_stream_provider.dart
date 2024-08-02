import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kohatian_foundation/widget_export.dart';


final entryStreamProvider = StreamProvider<List<Entry>>((ref) {
  final firestore = FirebaseFirestore.instance;
  return firestore.collection('entrys').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      return Entry.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  });
});
