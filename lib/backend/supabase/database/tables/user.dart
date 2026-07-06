import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'User';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userImgURL => getField<String>('user_imgURL');
  set userImgURL(String? value) => setField<String>('user_imgURL', value);

  List<String> get userPreferredTags =>
      getListField<String>('user_preferredTags');
  set userPreferredTags(List<String>? value) =>
      setListField<String>('user_preferredTags', value);

  String? get userBio => getField<String>('user_bio');
  set userBio(String? value) => setField<String>('user_bio', value);

  List<String> get following => getListField<String>('following');
  set following(List<String>? value) =>
      setListField<String>('following', value);

  List<String> get followers => getListField<String>('followers');
  set followers(List<String>? value) =>
      setListField<String>('followers', value);

  bool? get isArtist => getField<bool>('isArtist');
  set isArtist(bool? value) => setField<bool>('isArtist', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);
}
