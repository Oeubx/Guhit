import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_LastMsg" field.
  String? _userLastMsg;
  String get userLastMsg => _userLastMsg ?? '';
  bool hasUserLastMsg() => _userLastMsg != null;

  // "lastchat_timeStamp" field.
  DateTime? _lastchatTimeStamp;
  DateTime? get lastchatTimeStamp => _lastchatTimeStamp;
  bool hasLastchatTimeStamp() => _lastchatTimeStamp != null;

  // "lastMsg_seenBy" field.
  List<DocumentReference>? _lastMsgSeenBy;
  List<DocumentReference> get lastMsgSeenBy => _lastMsgSeenBy ?? const [];
  bool hasLastMsgSeenBy() => _lastMsgSeenBy != null;

  // "chat_initiator" field.
  DocumentReference? _chatInitiator;
  DocumentReference? get chatInitiator => _chatInitiator;
  bool hasChatInitiator() => _chatInitiator != null;

  // "initiator_chosenOne" field.
  DocumentReference? _initiatorChosenOne;
  DocumentReference? get initiatorChosenOne => _initiatorChosenOne;
  bool hasInitiatorChosenOne() => _initiatorChosenOne != null;

  // "user_UIDS" field.
  List<DocumentReference>? _userUIDS;
  List<DocumentReference> get userUIDS => _userUIDS ?? const [];
  bool hasUserUIDS() => _userUIDS != null;

  // "user_names" field.
  List<String>? _userNames;
  List<String> get userNames => _userNames ?? const [];
  bool hasUserNames() => _userNames != null;

  // "is_transaction" field.
  bool? _isTransaction;
  bool get isTransaction => _isTransaction ?? false;
  bool hasIsTransaction() => _isTransaction != null;

  void _initializeFields() {
    _userLastMsg = snapshotData['user_LastMsg'] as String?;
    _lastchatTimeStamp = snapshotData['lastchat_timeStamp'] as DateTime?;
    _lastMsgSeenBy = getDataList(snapshotData['lastMsg_seenBy']);
    _chatInitiator = snapshotData['chat_initiator'] as DocumentReference?;
    _initiatorChosenOne =
        snapshotData['initiator_chosenOne'] as DocumentReference?;
    _userUIDS = getDataList(snapshotData['user_UIDS']);
    _userNames = getDataList(snapshotData['user_names']);
    _isTransaction = snapshotData['is_transaction'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? userLastMsg,
  DateTime? lastchatTimeStamp,
  DocumentReference? chatInitiator,
  DocumentReference? initiatorChosenOne,
  bool? isTransaction,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_LastMsg': userLastMsg,
      'lastchat_timeStamp': lastchatTimeStamp,
      'chat_initiator': chatInitiator,
      'initiator_chosenOne': initiatorChosenOne,
      'is_transaction': isTransaction,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userLastMsg == e2?.userLastMsg &&
        e1?.lastchatTimeStamp == e2?.lastchatTimeStamp &&
        listEquality.equals(e1?.lastMsgSeenBy, e2?.lastMsgSeenBy) &&
        e1?.chatInitiator == e2?.chatInitiator &&
        e1?.initiatorChosenOne == e2?.initiatorChosenOne &&
        listEquality.equals(e1?.userUIDS, e2?.userUIDS) &&
        listEquality.equals(e1?.userNames, e2?.userNames) &&
        e1?.isTransaction == e2?.isTransaction;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.userLastMsg,
        e?.lastchatTimeStamp,
        e?.lastMsgSeenBy,
        e?.chatInitiator,
        e?.initiatorChosenOne,
        e?.userUIDS,
        e?.userNames,
        e?.isTransaction
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
