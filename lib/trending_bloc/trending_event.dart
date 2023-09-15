part of 'trending_bloc.dart';

@immutable
sealed class TrendingEvent {}

class TrendingFetchingEvent extends TrendingEvent {}

class NavigationEvent extends TrendingEvent {
  final String routeName;
  final SimpleModel indexData;

  NavigationEvent(this.routeName, this.indexData);
  List<Object> get props => [routeName, indexData];
}
