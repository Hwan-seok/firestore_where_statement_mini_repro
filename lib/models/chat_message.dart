import 'package:cloud_firestore/cloud_firestore.dart';

part 'chat_message.g.dart';

class ChatMessage {
  final String message;
  final DateTime sentDateTime;

  ChatMessage({
    required this.message,
    required this.sentDateTime,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  static dateTimeFromJson(Timestamp timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  }

  static dateTimeToTimestamp(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }
}
