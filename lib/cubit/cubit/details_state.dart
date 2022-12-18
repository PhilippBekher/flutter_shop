// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'details_cubit.dart';

class DetailsState extends Equatable {
  final Record? item;
  DetailsState({
    this.item,
  });

  @override
  List<Object?> get props => [item];
}
