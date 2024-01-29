import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/supply.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addSupply(Supply supply) async {
    await _firestore.collection('supplies').add(supply.toMap());
  }

  Stream<List<Supply>> streamSupplies() {
    return _firestore
        .collection('supplies')
        .snapshots()
        .map((QuerySnapshot query) {
      return query.docs.map((doc) {
        print("Document ID: ${doc.id}");
        print("Document Data: ${doc.data()}");

        return Supply.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
