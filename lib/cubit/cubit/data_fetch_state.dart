part of 'data_fetch_cubit.dart';

abstract class DataFetchState extends Equatable {
  const DataFetchState();

  @override
  List<Object> get props => [];
}

class DataFetchInitial extends DataFetchState {}

class DataFetchLoading extends DataFetchState {}

class DataFetchLoaded extends DataFetchState {
  final List<Record> results;

  DataFetchLoaded({required this.results});

  @override
  // TODO: implement props
  List<Object> get props => [results];
}
