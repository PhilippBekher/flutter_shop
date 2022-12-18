import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../domain/model/products.dart';

part 'search_value_state.dart';

class SearchValueCubit extends Cubit<SearchValueState> {
  SearchValueCubit()
      : super(SearchValueState(value: '', records: [], suggestions: []));

  void showSuggestions(String input_txt, List<Record> records) {
    final Suggestions = records.where((element) {
      final name = element.fields.name.toLowerCase();
      final input = input_txt.toLowerCase();
      return name.contains(input);
    }).toList();
    if (input_txt == '') {
      emit(state.copyWith(value: input_txt, suggestions: records));
      return;
    }
    if (input_txt != '') {
      emit(state.copyWith(value: input_txt, suggestions: Suggestions));
    }
  }

  //   void showSuggestions(String input_txt, List<Record> records) {
  //   final Suggestions = state.records.where((element) {
  //     final name = element.fields.name.toLowerCase();
  //     final input = input_txt.toLowerCase();
  //     return name.contains(input);
  //   }).toList();
  //   if (input_txt != '') {
  //     emit(state.copyWith(value: input_txt, records: Suggestions));
  //   }
  //   if (input_txt == '') {
  //     emit(state.copyWith(records: records, value: ''));
  //   }
  // }
}
