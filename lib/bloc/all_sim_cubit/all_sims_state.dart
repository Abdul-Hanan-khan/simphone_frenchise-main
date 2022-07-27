part of 'all_sims_cubit.dart';

abstract class AllSimsState extends Equatable {
  const AllSimsState();

  @override
  List<Object> get props => [];
}

class AllSimsInitial extends AllSimsState {}

class LoadingState extends AllSimsState {}

class AllSimsFetchedSuccessfully extends AllSimsState {
  final List<Sims> allSims;

  const AllSimsFetchedSuccessfully(this.allSims);
}

class FailedToFetchedSims extends AllSimsState {
  final String message;

  const FailedToFetchedSims(this.message);
}

class DeleteSimSuccessfully extends AllSimsState {
  final String message;

  const DeleteSimSuccessfully(this.message);
}

class FailedToDeleteSim extends AllSimsState {
  final String message;

  const FailedToDeleteSim(this.message);
}
