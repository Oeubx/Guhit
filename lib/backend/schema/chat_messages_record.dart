import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_Msg" field.
  String? _userMsg;
  String get userMsg => _userMsg ?? '';
  bool hasUserMsg() => _userMsg != null;

  // "msg_TimeSent" field.
  DateTime? _msgTimeSent;
  DateTime? get msgTimeSent => _msgTimeSent;
  bool hasMsgTimeSent() => _msgTimeSent != null;

  // "userMsgSender_Reference" field.
  DocumentReference? _userMsgSenderReference;
  DocumentReference? get userMsgSenderReference => _userMsgSenderReference;
  bool hasUserMsgSenderReference() => _userMsgSenderReference != null;

  // "msgNameOf_Sender" field.
  String? _msgNameOfSender;
  String get msgNameOfSender => _msgNameOfSender ?? '';
  bool hasMsgNameOfSender() => _msgNameOfSender != null;

  // "user_ImgMsg" field.
  String? _userImgMsg;
  String get userImgMsg => _userImgMsg ?? '';
  bool hasUserImgMsg() => _userImgMsg != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userMsg = snapshotData['user_Msg'] as String?;
    _msgTimeSent = snapshotData['msg_TimeSent'] as DateTime?;
    _userMsgSenderReference =
        snapshotData['userMsgSender_Reference'] as DocumentReference?;
    _msgNameOfSender = snapshotData['msgNameOf_Sender'] as String?;
    _userImgMsg = snapshotData['user_ImgMsg'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_messages')
          : FirebaseFirestore.instance.collectionGroup('chat_messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chat_messages').doc(id);

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  String? userMsg,
  DateTime? msgTimeSent,
  DocumentReference? userMsgSenderReference,
  String? msgNameOfSender,
  String? userImgMsg,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_Msg': userMsg,
      'msg_TimeSent': msgTimeSent,
      'userMsgSender_Reference': userMsgSenderReference,
      'msgNameOf_Sender': msgNameOfSender,
      'user_ImgMsg': userImgMsg,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    return e1?.userMsg == e2?.userMsg &&
        e1?.msgTimeSent == e2?.msgTimeSent &&
        e1?.userMsgSenderReference == e2?.userMsgSenderReference &&
        e1?.msgNameOfSender == e2?.msgNameOfSender &&
        e1?.userImgMsg == e2?.userImgMsg;
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality().hash([
        e?.userMsg,
        e?.msgTimeSent,
        e?.userMsgSenderReference,
        e?.msgNameOfSender,
        e?.userImgMsg
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
