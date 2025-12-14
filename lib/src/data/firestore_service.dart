import 'package:cloud_firestore/cloud_firestore.dart';
import 'item_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Item>> getItems() {
    return _db.collection('items').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Item.fromFirestore(doc)).toList());
  }
}
