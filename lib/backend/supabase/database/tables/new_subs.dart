import '../database.dart';

class NewSubsTable extends SupabaseTable<NewSubsRow> {
  @override
  String get tableName => 'newSubs';

  @override
  NewSubsRow createRow(Map<String, dynamic> data) => NewSubsRow(data);
}

class NewSubsRow extends SupabaseDataRow {
  NewSubsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NewSubsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get mediaLink => getField<String>('media_link');
  set mediaLink(String? value) => setField<String>('media_link', value);

  String? get brandName => getField<String>('brand_name');
  set brandName(String? value) => setField<String>('brand_name', value);

  String? get submitterName => getField<String>('submitter_name');
  set submitterName(String? value) => setField<String>('submitter_name', value);

  String? get flowDone => getField<String>('flow_done');
  set flowDone(String? value) => setField<String>('flow_done', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get submitterSurname => getField<String>('submitter_surname');
  set submitterSurname(String? value) =>
      setField<String>('submitter_surname', value);

  String? get transcription => getField<String>('transcription');
  set transcription(String? value) => setField<String>('transcription', value);

  int? get rating => getField<int>('rating');
  set rating(int? value) => setField<int>('rating', value);

  bool? get boolMail => getField<bool>('boolMail');
  set boolMail(bool? value) => setField<bool>('boolMail', value);

  String? get question => getField<String>('question');
  set question(String? value) => setField<String>('question', value);

  String? get clubRugby => getField<String>('club_rugby');
  set clubRugby(String? value) => setField<String>('club_rugby', value);

  String? get instagram => getField<String>('instagram');
  set instagram(String? value) => setField<String>('instagram', value);
}
