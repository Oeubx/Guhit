import '../database.dart';

class UploadsTable extends SupabaseTable<UploadsRow> {
  @override
  String get tableName => 'Uploads';

  @override
  UploadsRow createRow(Map<String, dynamic> data) => UploadsRow(data);
}

class UploadsRow extends SupabaseDataRow {
  UploadsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UploadsTable();

  String? get uploadId => getField<String>('upload_id');
  set uploadId(String? value) => setField<String>('upload_id', value);

  String? get uploaderId => getField<String>('uploader_Id');
  set uploaderId(String? value) => setField<String>('uploader_Id', value);

  String? get uploadContent => getField<String>('uploadContent');
  set uploadContent(String? value) => setField<String>('uploadContent', value);

  String? get uploadimgURL => getField<String>('uploadimg_URL');
  set uploadimgURL(String? value) => setField<String>('uploadimg_URL', value);

  List<String> get likes => getListField<String>('likes');
  set likes(List<String>? value) => setListField<String>('likes', value);

  DateTime get lastUpdatedAt => getField<DateTime>('last_updated_at')!;
  set lastUpdatedAt(DateTime value) =>
      setField<DateTime>('last_updated_at', value);

  bool? get isPortfolio => getField<bool>('isPortfolio');
  set isPortfolio(bool? value) => setField<bool>('isPortfolio', value);

  List<String> get tags => getListField<String>('tags');
  set tags(List<String>? value) => setListField<String>('tags', value);
}
