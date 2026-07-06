import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "artist" field.
  bool? _artist;
  bool get artist => _artist ?? false;
  bool hasArtist() => _artist != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "users_imFollowing" field.
  List<DocumentReference>? _usersImFollowing;
  List<DocumentReference> get usersImFollowing => _usersImFollowing ?? const [];
  bool hasUsersImFollowing() => _usersImFollowing != null;

  // "users_FollowingMe" field.
  List<DocumentReference>? _usersFollowingMe;
  List<DocumentReference> get usersFollowingMe => _usersFollowingMe ?? const [];
  bool hasUsersFollowingMe() => _usersFollowingMe != null;

  // "bg_photoUrl" field.
  String? _bgPhotoUrl;
  String get bgPhotoUrl => _bgPhotoUrl ?? '';
  bool hasBgPhotoUrl() => _bgPhotoUrl != null;

  // "user_personalmsgListRef" field.
  List<DocumentReference>? _userPersonalmsgListRef;
  List<DocumentReference> get userPersonalmsgListRef =>
      _userPersonalmsgListRef ?? const [];
  bool hasUserPersonalmsgListRef() => _userPersonalmsgListRef != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _password = snapshotData['password'] as String?;
    _artist = snapshotData['artist'] as bool?;
    _admin = snapshotData['admin'] as bool?;
    _bio = snapshotData['bio'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _username = snapshotData['username'] as String?;
    _usersImFollowing = getDataList(snapshotData['users_imFollowing']);
    _usersFollowingMe = getDataList(snapshotData['users_FollowingMe']);
    _bgPhotoUrl = snapshotData['bg_photoUrl'] as String?;
    _userPersonalmsgListRef =
        getDataList(snapshotData['user_personalmsgListRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? password,
  bool? artist,
  bool? admin,
  String? bio,
  String? phoneNumber,
  String? username,
  String? bgPhotoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'password': password,
      'artist': artist,
      'admin': admin,
      'bio': bio,
      'phone_number': phoneNumber,
      'username': username,
      'bg_photoUrl': bgPhotoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.password == e2?.password &&
        e1?.artist == e2?.artist &&
        e1?.admin == e2?.admin &&
        e1?.bio == e2?.bio &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.username == e2?.username &&
        listEquality.equals(e1?.usersImFollowing, e2?.usersImFollowing) &&
        listEquality.equals(e1?.usersFollowingMe, e2?.usersFollowingMe) &&
        e1?.bgPhotoUrl == e2?.bgPhotoUrl &&
        listEquality.equals(
            e1?.userPersonalmsgListRef, e2?.userPersonalmsgListRef);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.password,
        e?.artist,
        e?.admin,
        e?.bio,
        e?.phoneNumber,
        e?.username,
        e?.usersImFollowing,
        e?.usersFollowingMe,
        e?.bgPhotoUrl,
        e?.userPersonalmsgListRef
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
