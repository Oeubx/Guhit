import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersCommsRecord extends FirestoreRecord {
  OrdersCommsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comms_creator" field.
  DocumentReference? _commsCreator;
  DocumentReference? get commsCreator => _commsCreator;
  bool hasCommsCreator() => _commsCreator != null;

  // "comms_commissioner" field.
  DocumentReference? _commsCommissioner;
  DocumentReference? get commsCommissioner => _commsCommissioner;
  bool hasCommsCommissioner() => _commsCommissioner != null;

  // "comms_title" field.
  String? _commsTitle;
  String get commsTitle => _commsTitle ?? '';
  bool hasCommsTitle() => _commsTitle != null;

  // "comms_desc" field.
  String? _commsDesc;
  String get commsDesc => _commsDesc ?? '';
  bool hasCommsDesc() => _commsDesc != null;

  // "comms_price" field.
  String? _commsPrice;
  String get commsPrice => _commsPrice ?? '';
  bool hasCommsPrice() => _commsPrice != null;

  // "is_paid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "latest_date_updated" field.
  DateTime? _latestDateUpdated;
  DateTime? get latestDateUpdated => _latestDateUpdated;
  bool hasLatestDateUpdated() => _latestDateUpdated != null;

  // "comms_img" field.
  String? _commsImg;
  String get commsImg => _commsImg ?? '';
  bool hasCommsImg() => _commsImg != null;

  // "for_approval" field.
  bool? _forApproval;
  bool get forApproval => _forApproval ?? false;
  bool hasForApproval() => _forApproval != null;

  // "is_WIP" field.
  bool? _isWIP;
  bool get isWIP => _isWIP ?? false;
  bool hasIsWIP() => _isWIP != null;

  // "is_completed" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "is_canceled" field.
  bool? _isCanceled;
  bool get isCanceled => _isCanceled ?? false;
  bool hasIsCanceled() => _isCanceled != null;

  void _initializeFields() {
    _commsCreator = snapshotData['comms_creator'] as DocumentReference?;
    _commsCommissioner =
        snapshotData['comms_commissioner'] as DocumentReference?;
    _commsTitle = snapshotData['comms_title'] as String?;
    _commsDesc = snapshotData['comms_desc'] as String?;
    _commsPrice = snapshotData['comms_price'] as String?;
    _isPaid = snapshotData['is_paid'] as bool?;
    _latestDateUpdated = snapshotData['latest_date_updated'] as DateTime?;
    _commsImg = snapshotData['comms_img'] as String?;
    _forApproval = snapshotData['for_approval'] as bool?;
    _isWIP = snapshotData['is_WIP'] as bool?;
    _isCompleted = snapshotData['is_completed'] as bool?;
    _isCanceled = snapshotData['is_canceled'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders_comms');

  static Stream<OrdersCommsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersCommsRecord.fromSnapshot(s));

  static Future<OrdersCommsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersCommsRecord.fromSnapshot(s));

  static OrdersCommsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrdersCommsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersCommsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersCommsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersCommsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersCommsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersCommsRecordData({
  DocumentReference? commsCreator,
  DocumentReference? commsCommissioner,
  String? commsTitle,
  String? commsDesc,
  String? commsPrice,
  bool? isPaid,
  DateTime? latestDateUpdated,
  String? commsImg,
  bool? forApproval,
  bool? isWIP,
  bool? isCompleted,
  bool? isCanceled,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comms_creator': commsCreator,
      'comms_commissioner': commsCommissioner,
      'comms_title': commsTitle,
      'comms_desc': commsDesc,
      'comms_price': commsPrice,
      'is_paid': isPaid,
      'latest_date_updated': latestDateUpdated,
      'comms_img': commsImg,
      'for_approval': forApproval,
      'is_WIP': isWIP,
      'is_completed': isCompleted,
      'is_canceled': isCanceled,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersCommsRecordDocumentEquality implements Equality<OrdersCommsRecord> {
  const OrdersCommsRecordDocumentEquality();

  @override
  bool equals(OrdersCommsRecord? e1, OrdersCommsRecord? e2) {
    return e1?.commsCreator == e2?.commsCreator &&
        e1?.commsCommissioner == e2?.commsCommissioner &&
        e1?.commsTitle == e2?.commsTitle &&
        e1?.commsDesc == e2?.commsDesc &&
        e1?.commsPrice == e2?.commsPrice &&
        e1?.isPaid == e2?.isPaid &&
        e1?.latestDateUpdated == e2?.latestDateUpdated &&
        e1?.commsImg == e2?.commsImg &&
        e1?.forApproval == e2?.forApproval &&
        e1?.isWIP == e2?.isWIP &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.isCanceled == e2?.isCanceled;
  }

  @override
  int hash(OrdersCommsRecord? e) => const ListEquality().hash([
        e?.commsCreator,
        e?.commsCommissioner,
        e?.commsTitle,
        e?.commsDesc,
        e?.commsPrice,
        e?.isPaid,
        e?.latestDateUpdated,
        e?.commsImg,
        e?.forApproval,
        e?.isWIP,
        e?.isCompleted,
        e?.isCanceled
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersCommsRecord;
}
