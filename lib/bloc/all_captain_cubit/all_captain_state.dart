part of 'all_captain_cubit.dart';

abstract class AllCaptainState extends Equatable {
  const AllCaptainState();

  @override
  List<Object> get props => [];
}

class AllCaptainInitial extends AllCaptainState {}

class LoadingState extends AllCaptainState {}

class AllCaptainGetSuccessfully extends AllCaptainState {
  final List<Captains>? captains;

  const AllCaptainGetSuccessfully(this.captains);
}

class FailedToFetchedAllCaptain extends AllCaptainState {
  final String message;

  const FailedToFetchedAllCaptain(this.message);
}
