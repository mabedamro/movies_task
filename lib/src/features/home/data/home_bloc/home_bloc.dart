import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_event.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_state.dart';
import 'package:movies_task/src/features/home/data/repo/movies_repo.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository movieRepository;

  HomeBloc(this.movieRepository) : super(HomeInitial()) {
    on<FetchTrendingMovies>(_onFetchTrendingMovies);
  }

  Future<void> _onFetchTrendingMovies(
      FetchTrendingMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final movies = await movieRepository.fetchTrendingMovies();
      emit(HomeLoaded(movies));
    } catch (error) {
      emit(HomeError(error.toString()));
    }
  }
}
