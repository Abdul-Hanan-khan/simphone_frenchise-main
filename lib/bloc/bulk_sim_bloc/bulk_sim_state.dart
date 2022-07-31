


// import 'package:equatable/equatable.dart';
// part of 'add_new_sim_cubit.dart';
import 'package:equatable/equatable.dart';

abstract class AddBulkSimsState extends Equatable {
  const AddBulkSimsState();

  @override
  List<Object> get props => [];
}

class AddBulkSimsInitial extends AddBulkSimsState {}

class BulkLoadingState extends AddBulkSimsState {}

class AddBulkSimsSuccessfully extends AddBulkSimsState {
  final String message;

   AddBulkSimsSuccessfully(this.message);
}

class FailedToAddBulk extends AddBulkSimsState {
  final String message;

   FailedToAddBulk(this.message);
}


class FailedToFetchedData extends AddBulkSimsState {
  final String message;

  const FailedToFetchedData(this.message);
}


