import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/model/products.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsState());

  void show_details(item) {
    emit(DetailsState(item: item));
  }
}
