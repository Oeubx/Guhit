import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityPostCommentsRecord extends FirestoreRecord {
  CommunityPostCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_time" field.
  DateTime? _commentTime;
  DateTime? get commentTime => _commentTime;
  bool hasCommentTime() => _commentTime != null;

  // "comment_text" field.
  String? _commentText;
  String get commentText => _commentText ?? '';
  bool hasCommentText() => _commentText != null;

  // "comment_postRef" field.
  DocumentReference? _commentPostRef;
  DocumentReference? get commentPostRef => _commentPostRef;
  bool hasCommentPostRef() => _commentPostRef != null;

  // "comment_userRef" field.
  DocumentReference? _commentUserRef;
  DocumentReference? get commentUserRef => _commentUserRef;
  bool hasCommentUserRef() => _commentUserRef != null;

  void _initializeFields() {
    _commentTime = snapshotData['comment_time'] as DateTime?;
    _commentText = snapshotData['comment_text'] as String?;
    _commentPostRef = snapshotData['comment_postRef'] as DocumentReference?;
    _commentUserRef = snapshotData['comment_userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CommunityPost_comments');

  static Stream<CommunityPostCommentsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityPostCommentsRecord.fromSnapshot(s));

  static Future<CommunityPostCommentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CommunityPostCommentsRecord.fromSnapshot(s));

  static CommunityPostCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityPostCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityPostCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityPostCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityPostCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityPostCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityPostCommentsRecordData({
  DateTime? commentTime,
  String? commentText,
  DocumentReference? commentPostRef,
  DocumentReference? commentUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_time': commentTime,
      'comment_text': commentText,
      'comment_postRef': commentPostRef,
      'comment_userRef': commentUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityPostCommentsRecordDocumentEquality
    implements Equality<CommunityPostCommentsRecord> {
  const CommunityPostCommentsRecordDocumentEquality();

  @override
  bool equals(
      CommunityPostCommentsRecord? e1, CommunityPostCommentsRecord? e2) {
    return e1?.commentTime == e2?.commentTime &&
        e1?.commentText == e2?.commentText &&
        e1?.commentPostRef == e2?.commentPostRef &&
        e1?.commentUserRef == e2?.commentUserRef;
  }

  @override
  int hash(CommunityPostCommentsRecord? e) => const ListEquality().hash(
      [e?.commentTime, e?.commentText, e?.commentPostRef, e?.commentUserRef]);

  @override
  bool isValidKey(Object? o) => o is CommunityPostCommentsRecord;
}
