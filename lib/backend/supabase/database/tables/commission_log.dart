import '../database.dart';

class CommissionLogTable extends SupabaseTable<CommissionLogRow> {
  @override
  String get tableName => 'Commission Log';

  @override
  CommissionLogRow createRow(Map<String, dynamic> data) =>
      CommissionLogRow(data);
}

class CommissionLogRow extends SupabaseDataRow {
  CommissionLogRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommissionLogTable();

  String? get clogId => getField<String>('clog_id');
  set clogId(String? value) => setField<String>('clog_id', value);

  String get commissionIdRef => getField<String>('commission_idRef')!;
  set commissionIdRef(String value) =>
      setField<String>('commission_idRef', value);

  String get fromStatus => getField<String>('from_status')!;
  set fromStatus(String value) => setField<String>('from_status', value);

  String get toStatus => getField<String>('to_status')!;
  set toStatus(String value) => setField<String>('to_status', value);

  String get updatedBy => getField<String>('updated_by')!;
  set updatedBy(String value) => setField<String>('updated_by', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get cRemarks => getField<String>('c_remarks');
  set cRemarks(String? value) => setField<String>('c_remarks', value);

  String? get cImgLink => getField<String>('c_imgLink');
  set cImgLink(String? value) => setField<String>('c_imgLink', value);
}
