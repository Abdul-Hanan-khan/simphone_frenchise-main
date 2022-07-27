part of 'add_new_sim_cubit.dart';

abstract class AddNewSimState extends Equatable {
  const AddNewSimState();

  @override
  List<Object> get props => [];
}

class AddNewSimInitial extends AddNewSimState {}

class LoadingState extends AddNewSimState {}

class AddNewSimSuccessfully extends AddNewSimState {
  final String message;

  const AddNewSimSuccessfully(this.message);
}

class FailedToAddNewSim extends AddNewSimState {
  final String message;

  const FailedToAddNewSim(this.message);
}


class FailedToFetchedData extends AddNewSimState {
  final String message;

  const FailedToFetchedData(this.message);
}

class AllPackagesGetSuccessfully extends AddNewSimState {

  final List<Packages> packages;

  const AllPackagesGetSuccessfully(this.packages);

}
class EditSimSuccessfully extends AddNewSimState {
  final String message;

  const EditSimSuccessfully(this.message);
}
class FailedToEditSim extends AddNewSimState {
  final String message;

  const FailedToEditSim(this.message);
}
class AllDataPackagesGetSuccessfully extends AddNewSimState {

  final List<DataPackages> packages;

  const AllDataPackagesGetSuccessfully(this.packages);

}
