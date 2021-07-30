import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_where_clause_reproduction/models/chat_message.dart';

class FireStoreHelper {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static const String collectionName = "messages";

  static CollectionReference<ChatMessage> _collectionReference() {
    return firestore.collection(collectionName).withConverter<ChatMessage>(
        fromFirestore: (snapshots, _) => ChatMessage.fromJson(snapshots.data()!),
        toFirestore: (chatMessage, _) => chatMessage.toJson());
  }

  static Future<void> sendMessage(ChatMessage message) async {
    await _collectionReference().add(message);
  }

  static Stream<QuerySnapshot<ChatMessage>> getMessages() {
    return _collectionReference()
        .orderBy("sentDateTime", descending: true)
        .where(
          // <== works properly when deleting this where clause
          "sentDateTime",
          isLessThanOrEqualTo: DateTime.now(),
        )
        .limit(1000)
        .snapshots();
  }
}
