import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/domain/model/products.dart';
import 'package:myapp/domain/repository/products_repository.dart';

part 'data_fetch_state.dart';

class DataFetchCubit extends Cubit<DataFetchState> {
  final ProductsRepository productsRepository;

  DataFetchCubit({required this.productsRepository})
      : super(DataFetchInitial());

  Future<void> fetchDataApi() async {
    emit(DataFetchLoading());
    try {
      final List<Record> results = await productsRepository.getProducts();
      emit(DataFetchLoaded(results: results));
    } catch (e) {
      print(e);
    }
  }
}
