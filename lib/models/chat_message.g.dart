// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return ChatMessage(
    message: json['message'] as String,
    sentDateTime: ChatMessage.dateTimeFromJson(json['sentDateTime'] as Timestamp),
  );
}

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) => <String, dynamic>{
      'message': instance.message,
      'sentDateTime': ChatMessage.dateTimeToTimestamp(instance.sentDateTime),
    };
