part of 'captain_mobile_cubit.dart';

abstract class CaptainMobileState extends Equatable {
  const CaptainMobileState();

  @override
  List<Object> get props => [];
}

class CaptainMobileInitial extends CaptainMobileState {}

class LoadingState extends CaptainMobileState {}

class CaptainMobileFetchedSuccessfully extends CaptainMobileState {
  final List<Devices> mobile;

  const CaptainMobileFetchedSuccessfully(this.mobile);
}

class FailedToFetchedData extends CaptainMobileState {
  final String message;

  const FailedToFetchedData(this.message);
}
