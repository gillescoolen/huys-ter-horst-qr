import 'package:cloud_firestore/cloud_firestore.dart';

class ItemData {
  final String title;
  final String subtitle;
  final String content;
  final List<dynamic> images;
  final DocumentReference reference;

  ItemData.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['subtitle'] != null),
        assert(map['content'] != null),
        title = map['title'],
        subtitle = map['subtitle'],
        content = map['content'],
        images = map['images'];

  ItemData.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
