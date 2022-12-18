import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../domain/model/products.dart';
part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(BasketState(records: []));

  void add_product(value) {
    // emit(state.copyWith(
    //     records: List.from(state.records!.toList())..add(value)));

    if (state.records!.contains(value)) {
      emit(state.copyWith(
          records: List.from(state.records!.toList())..remove(value)));
    } else {
      emit(state.copyWith(
          records: List.from(state.records!.toList())..add(value)));
    }
  }
}
