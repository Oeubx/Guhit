import '../database.dart';

class ConversationTable extends SupabaseTable<ConversationRow> {
  @override
  String get tableName => 'Conversation';

  @override
  ConversationRow createRow(Map<String, dynamic> data) => ConversationRow(data);
}

class ConversationRow extends SupabaseDataRow {
  ConversationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConversationTable();

  String? get convoId => getField<String>('convo_id');
  set convoId(String? value) => setField<String>('convo_id', value);

  List<String> get userIDs => getListField<String>('user_IDs');
  set userIDs(List<String>? value) => setListField<String>('user_IDs', value);

  String get lastMessageSender => getField<String>('lastMessage_sender')!;
  set lastMessageSender(String value) =>
      setField<String>('lastMessage_sender', value);

  DateTime? get lastMessageTime => getField<DateTime>('lastMessage_time');
  set lastMessageTime(DateTime? value) =>
      setField<DateTime>('lastMessage_time', value);

  String? get lastMessageContent => getField<String>('lastMessage_content');
  set lastMessageContent(String? value) =>
      setField<String>('lastMessage_content', value);
}
