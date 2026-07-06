import '../database.dart';

class CommissionTable extends SupabaseTable<CommissionRow> {
  @override
  String get tableName => 'Commission';

  @override
  CommissionRow createRow(Map<String, dynamic> data) => CommissionRow(data);
}

class CommissionRow extends SupabaseDataRow {
  CommissionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommissionTable();

  String? get commissionId => getField<String>('commission_id');
  set commissionId(String? value) => setField<String>('commission_id', value);

  String? get commissionerId => getField<String>('commissioner_id');
  set commissionerId(String? value) =>
      setField<String>('commissioner_id', value);

  String? get commissionedId => getField<String>('commissioned_id');
  set commissionedId(String? value) =>
      setField<String>('commissioned_id', value);

  String? get commissionStatus => getField<String>('commission_status');
  set commissionStatus(String? value) =>
      setField<String>('commission_status', value);

  String? get commissionTitle => getField<String>('commission_title');
  set commissionTitle(String? value) =>
      setField<String>('commission_title', value);

  String? get commissionDesc => getField<String>('commission_desc');
  set commissionDesc(String? value) =>
      setField<String>('commission_desc', value);

  String? get commissionPrice => getField<String>('commission_price');
  set commissionPrice(String? value) =>
      setField<String>('commission_price', value);

  bool? get commissionedIsPaid => getField<bool>('commissioned_isPaid');
  set commissionedIsPaid(bool? value) =>
      setField<bool>('commissioned_isPaid', value);

  int? get commissionRating => getField<int>('commission_rating');
  set commissionRating(int? value) => setField<int>('commission_rating', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get remarks => getField<String>('remarks');
  set remarks(String? value) => setField<String>('remarks', value);
}
