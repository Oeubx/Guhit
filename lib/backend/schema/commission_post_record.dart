import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommissionPostRecord extends FirestoreRecord {
  CommissionPostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_updated" field.
  DateTime? _timeUpdated;
  DateTime? get timeUpdated => _timeUpdated;
  bool hasTimeUpdated() => _timeUpdated != null;

  // "is_open" field.
  bool? _isOpen;
  bool get isOpen => _isOpen ?? false;
  bool hasIsOpen() => _isOpen != null;

  // "user_DocRef" field.
  DocumentReference? _userDocRef;
  DocumentReference? get userDocRef => _userDocRef;
  bool hasUserDocRef() => _userDocRef != null;

  // "commission_desc" field.
  String? _commissionDesc;
  String get commissionDesc => _commissionDesc ?? '';
  bool hasCommissionDesc() => _commissionDesc != null;

  // "bg_img" field.
  String? _bgImg;
  String get bgImg => _bgImg ?? '';
  bool hasBgImg() => _bgImg != null;

  // "price_range" field.
  String? _priceRange;
  String get priceRange => _priceRange ?? '';
  bool hasPriceRange() => _priceRange != null;

  // "comms_toc" field.
  String? _commsToc;
  String get commsToc => _commsToc ?? '';
  bool hasCommsToc() => _commsToc != null;

  void _initializeFields() {
    _timeUpdated = snapshotData['time_updated'] as DateTime?;
    _isOpen = snapshotData['is_open'] as bool?;
    _userDocRef = snapshotData['user_DocRef'] as DocumentReference?;
    _commissionDesc = snapshotData['commission_desc'] as String?;
    _bgImg = snapshotData['bg_img'] as String?;
    _priceRange = snapshotData['price_range'] as String?;
    _commsToc = snapshotData['comms_toc'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('commissionPost');

  static Stream<CommissionPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommissionPostRecord.fromSnapshot(s));

  static Future<CommissionPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommissionPostRecord.fromSnapshot(s));

  static CommissionPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommissionPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommissionPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommissionPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommissionPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommissionPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommissionPostRecordData({
  DateTime? timeUpdated,
  bool? isOpen,
  DocumentReference? userDocRef,
  String? commissionDesc,
  String? bgImg,
  String? priceRange,
  String? commsToc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_updated': timeUpdated,
      'is_open': isOpen,
      'user_DocRef': userDocRef,
      'commission_desc': commissionDesc,
      'bg_img': bgImg,
      'price_range': priceRange,
      'comms_toc': commsToc,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommissionPostRecordDocumentEquality
    implements Equality<CommissionPostRecord> {
  const CommissionPostRecordDocumentEquality();

  @override
  bool equals(CommissionPostRecord? e1, CommissionPostRecord? e2) {
    return e1?.timeUpdated == e2?.timeUpdated &&
        e1?.isOpen == e2?.isOpen &&
        e1?.userDocRef == e2?.userDocRef &&
        e1?.commissionDesc == e2?.commissionDesc &&
        e1?.bgImg == e2?.bgImg &&
        e1?.priceRange == e2?.priceRange &&
        e1?.commsToc == e2?.commsToc;
  }

  @override
  int hash(CommissionPostRecord? e) => const ListEquality().hash([
        e?.timeUpdated,
        e?.isOpen,
        e?.userDocRef,
        e?.commissionDesc,
        e?.bgImg,
        e?.priceRange,
        e?.commsToc
      ]);

  @override
  bool isValidKey(Object? o) => o is CommissionPostRecord;
}
