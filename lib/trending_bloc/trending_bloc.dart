import 'dart:async';
import 'package:avacado_test/Api/api_repository.dart';
import 'package:avacado_test/model/trending_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc() : super(TrendingInitial()) {
    on<TrendingFetchingEvent>(_onTrendingFetchingEvent);
    on<NavigationEvent>(_onNavigationEvent);
  }

  FutureOr<void> _onTrendingFetchingEvent(event, emit) async {
    final ApiProvider apiProvider = ApiProvider();
    emit(Trendingloading());
    print("here");
    final data = await apiProvider.getTrending();
    emit(TrendingLoaded(data: data));
  }

  FutureOr<void> _onNavigationEvent(
      NavigationEvent event, Emitter<TrendingState> emit) {
    emit(Navigation(route: event.routeName, indexData: event.indexData));
  }
}
