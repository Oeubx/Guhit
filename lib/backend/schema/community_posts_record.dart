import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityPostsRecord extends FirestoreRecord {
  CommunityPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "poster" field.
  DocumentReference? _poster;
  DocumentReference? get poster => _poster;
  bool hasPoster() => _poster != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "post_commentsRef" field.
  DocumentReference? _postCommentsRef;
  DocumentReference? get postCommentsRef => _postCommentsRef;
  bool hasPostCommentsRef() => _postCommentsRef != null;

  // "include_inPortfolio" field.
  bool? _includeInPortfolio;
  bool get includeInPortfolio => _includeInPortfolio ?? false;
  bool hasIncludeInPortfolio() => _includeInPortfolio != null;

  void _initializeFields() {
    _poster = snapshotData['poster'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _likes = getDataList(snapshotData['likes']);
    _postCommentsRef = snapshotData['post_commentsRef'] as DocumentReference?;
    _includeInPortfolio = snapshotData['include_inPortfolio'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('communityPosts');

  static Stream<CommunityPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityPostsRecord.fromSnapshot(s));

  static Future<CommunityPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityPostsRecord.fromSnapshot(s));

  static CommunityPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityPostsRecordData({
  DocumentReference? poster,
  String? image,
  DateTime? date,
  String? description,
  DocumentReference? postCommentsRef,
  bool? includeInPortfolio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'poster': poster,
      'image': image,
      'date': date,
      'description': description,
      'post_commentsRef': postCommentsRef,
      'include_inPortfolio': includeInPortfolio,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityPostsRecordDocumentEquality
    implements Equality<CommunityPostsRecord> {
  const CommunityPostsRecordDocumentEquality();

  @override
  bool equals(CommunityPostsRecord? e1, CommunityPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.poster == e2?.poster &&
        e1?.image == e2?.image &&
        e1?.date == e2?.date &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.postCommentsRef == e2?.postCommentsRef &&
        e1?.includeInPortfolio == e2?.includeInPortfolio;
  }

  @override
  int hash(CommunityPostsRecord? e) => const ListEquality().hash([
        e?.poster,
        e?.image,
        e?.date,
        e?.description,
        e?.likes,
        e?.postCommentsRef,
        e?.includeInPortfolio
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunityPostsRecord;
}
