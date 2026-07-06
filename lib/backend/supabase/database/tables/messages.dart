import '../database.dart';

class MessagesTable extends SupabaseTable<MessagesRow> {
  @override
  String get tableName => 'Messages';

  @override
  MessagesRow createRow(Map<String, dynamic> data) => MessagesRow(data);
}

class MessagesRow extends SupabaseDataRow {
  MessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessagesTable();

  String? get messageId => getField<String>('message_id');
  set messageId(String? value) => setField<String>('message_id', value);

  String? get convoIdRef => getField<String>('convo_id_Ref');
  set convoIdRef(String? value) => setField<String>('convo_id_Ref', value);

  String get messageBy => getField<String>('message_by')!;
  set messageBy(String value) => setField<String>('message_by', value);

  String? get messageContent => getField<String>('message_content');
  set messageContent(String? value) =>
      setField<String>('message_content', value);

  DateTime? get messageTimestamp => getField<DateTime>('message_timestamp');
  set messageTimestamp(DateTime? value) =>
      setField<DateTime>('message_timestamp', value);

  String? get messageAttachment => getField<String>('message_attachment');
  set messageAttachment(String? value) =>
      setField<String>('message_attachment', value);
}
