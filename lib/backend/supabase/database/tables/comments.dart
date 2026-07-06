import '../database.dart';

class CommentsTable extends SupabaseTable<CommentsRow> {
  @override
  String get tableName => 'Comments';

  @override
  CommentsRow createRow(Map<String, dynamic> data) => CommentsRow(data);
}

class CommentsRow extends SupabaseDataRow {
  CommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentsTable();

  String? get commentId => getField<String>('comment_id');
  set commentId(String? value) => setField<String>('comment_id', value);

  String? get uploadIdRef => getField<String>('upload_idRef');
  set uploadIdRef(String? value) => setField<String>('upload_idRef', value);

  String? get commentBy => getField<String>('comment_by');
  set commentBy(String? value) => setField<String>('comment_by', value);

  String? get commentContent => getField<String>('comment_content');
  set commentContent(String? value) =>
      setField<String>('comment_content', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
