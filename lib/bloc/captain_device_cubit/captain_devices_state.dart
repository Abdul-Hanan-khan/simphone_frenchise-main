part of 'captain_devices_cubit.dart';

abstract class CaptainDevicesState extends Equatable {
  const CaptainDevicesState();

  @override
  List<Object> get props => [];
}

class CaptainDevicesInitial extends CaptainDevicesState {}

class LoadingState extends CaptainDevicesState {}

class CaptainMobileFetchedSuccessfully extends CaptainDevicesState {
  final List<Devices> mobile;

  const CaptainMobileFetchedSuccessfully(this.mobile);
}

class FailedToFetchedData extends CaptainDevicesState {
  final String message;

  const FailedToFetchedData(this.message);
}