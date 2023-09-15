part of 'trending_bloc.dart';

@immutable
sealed class TrendingState {}

final class TrendingInitial extends TrendingState {}

final class Trendingloading extends TrendingState {}

final class TrendingLoaded extends TrendingState {
  final List<SimpleModel> data;
  TrendingLoaded({required this.data});
}

final class Navigation extends TrendingState {
  final String route;
  final SimpleModel indexData;
  Navigation({required this.route, required this.indexData});
}

final class TrendingError extends TrendingState {
  final String? message;
  TrendingError(this.message);
}
