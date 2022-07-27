part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class LoadingState extends DashboardState {}

class DashboardFetchedSuccessfully extends DashboardState {
  final DashboardApiResponse dashboardApiResponse;

  const DashboardFetchedSuccessfully(this.dashboardApiResponse);
}

class FailedToFetchedDashboard extends DashboardState {
  final String message;

  const FailedToFetchedDashboard(this.message);
}
