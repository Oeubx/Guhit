import '../database.dart';

class NotificationTable extends SupabaseTable<NotificationRow> {
  @override
  String get tableName => 'Notification';

  @override
  NotificationRow createRow(Map<String, dynamic> data) => NotificationRow(data);
}

class NotificationRow extends SupabaseDataRow {
  NotificationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationTable();

  String? get notificationId => getField<String>('notification_Id');
  set notificationId(String? value) =>
      setField<String>('notification_Id', value);

  bool? get isRead => getField<bool>('is_read');
  set isRead(bool? value) => setField<bool>('is_read', value);

  String? get madeBy => getField<String>('made_by');
  set madeBy(String? value) => setField<String>('made_by', value);

  String? get madeFor => getField<String>('made_for');
  set madeFor(String? value) => setField<String>('made_for', value);

  String get notifType => getField<String>('notif_type')!;
  set notifType(String value) => setField<String>('notif_type', value);

  String get docRef => getField<String>('doc_ref')!;
  set docRef(String value) => setField<String>('doc_ref', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
