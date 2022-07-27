part of 'order_update_status_cubit.dart';

abstract class OrderUpdateStatusState extends Equatable {
  const OrderUpdateStatusState();

  @override
  List<Object> get props => [];
}

class OrderUpdateStatusInitial extends OrderUpdateStatusState {}

class LoadingState extends OrderUpdateStatusState {}

class OrderUpdateSuccessfully extends OrderUpdateStatusState {
  final String message;

  const OrderUpdateSuccessfully(this.message);
}

class FailedToUpdateOrder extends OrderUpdateStatusState {
  final String message;

  const FailedToUpdateOrder(this.message);
}
class AllCaptainGetSuccessfully extends OrderUpdateStatusState {
  final List<Captains>? captains;

  const AllCaptainGetSuccessfully(this.captains);
}

class FailedToFetchedAllCaptain extends OrderUpdateStatusState {
  final String message;

  const FailedToFetchedAllCaptain(this.message);
}