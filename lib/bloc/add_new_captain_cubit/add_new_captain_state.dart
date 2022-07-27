part of 'add_new_captain_cubit.dart';

abstract class AddNewCaptainState extends Equatable {
  const AddNewCaptainState();

  @override
  List<Object> get props => [];
}

class AddNewCaptainInitial extends AddNewCaptainState {}

class LoadingState extends AddNewCaptainState {}

class AddCaptainSuccessfully extends AddNewCaptainState {
  final String message;

  const AddCaptainSuccessfully(this.message);
}

class FailedToAddCaptain extends AddNewCaptainState {
  final String message;

  const FailedToAddCaptain(this.message);
}
