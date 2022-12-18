// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_value_cubit.dart';

class SearchValueState {
  final String value;
  final List<Record> records;
  final List<Record> suggestions;

  SearchValueState({
    required this.value,
    required this.records,
    required this.suggestions,
  });

  SearchValueState copyWith({
    String? value,
    List<Record>? records,
    List<Record>? suggestions,
  }) {
    return SearchValueState(
      value: value ?? this.value,
      records: records ?? this.records,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}
