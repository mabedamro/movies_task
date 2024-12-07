import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_event.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_state.dart';
import 'package:movies_task/src/features/home/data/repo/movies_repo.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository movieRepository;

  HomeBloc(this.movieRepository) : super(HomeInitial()) {
    // Registering the event handlers
    on<FetchTrendingMovies>(_onFetchTrendingHomes);
    on<SearchMovies>(
        _onSearchHomes); // Register the handler for the SearchHomes event
  }

  Future<void> _onFetchTrendingHomes(
      FetchTrendingMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final movies = await movieRepository.fetchTrendingMovies();
      emit(HomeLoaded(movies));
    } catch (error) {
      emit(HomeError(error.toString()));
    }
  }

  Future<void> _onSearchHomes(
      SearchMovies event, Emitter<HomeState> emit) async {
    if (event.query.isEmpty) {
      emit(HomeInitial()); // If search query is empty, return to initial state
      return;
    }

    emit(HomeLoading());
    try {
      final movies = await movieRepository
          .searchMovies(event.query); // Fetch movies based on query
      emit(MovieSearchLoaded(movies)); // Emit the search results
    } catch (error) {
      emit(HomeError(error.toString()));
    }
  }
}
