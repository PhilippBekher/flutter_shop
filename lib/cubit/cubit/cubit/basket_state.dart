// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'basket_cubit.dart';

class BasketState extends Equatable {
  List<dynamic>? records;

  BasketState({
    this.records,
  });

  BasketState copyWith({
    records,
  }) {
    return BasketState(
      records: records ?? this.records,
    );
  }

  @override
  List<Object?> get props => [records];
}
