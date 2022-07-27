part of 'all_devices_cubit.dart';

abstract class AllDevicesState extends Equatable {
  const AllDevicesState();

  @override
  List<Object> get props => [];
}

class AllDevicesInitial extends AllDevicesState {}

class LoadingState extends AllDevicesState {}

class AllDevicesFetchedSuccessfully extends AllDevicesState {
  final List<Devices> devices;

  const AllDevicesFetchedSuccessfully(this.devices);
}

class FailedToFetchedDevices extends AllDevicesState {
  final String message;

  const FailedToFetchedDevices(this.message);
}
class AddDeviceSuccessfully extends AllDevicesState {
  final String message;

  const AddDeviceSuccessfully(this.message);
}
