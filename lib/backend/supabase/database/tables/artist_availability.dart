import '../database.dart';

class ArtistAvailabilityTable extends SupabaseTable<ArtistAvailabilityRow> {
  @override
  String get tableName => 'Artist Availability';

  @override
  ArtistAvailabilityRow createRow(Map<String, dynamic> data) =>
      ArtistAvailabilityRow(data);
}

class ArtistAvailabilityRow extends SupabaseDataRow {
  ArtistAvailabilityRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ArtistAvailabilityTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get artistIdRef => getField<String>('artist_idRef');
  set artistIdRef(String? value) => setField<String>('artist_idRef', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get price => getField<String>('price');
  set price(String? value) => setField<String>('price', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get totalRating => getField<int>('total_rating');
  set totalRating(int? value) => setField<int>('total_rating', value);
}
