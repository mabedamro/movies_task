import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_event.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_state.dart';
import 'package:movies_task/src/features/home/data/repo/home_repo.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository movieRepository;
  int _currentPage = 1; // Tracks the current page for pagination
  bool _isFetching = false; // Prevents duplicate fetch calls

  HomeBloc(this.movieRepository) : super(HomeInitial()) {
    // Registering the event handlers
    on<FetchTrendingMovies>(_onFetchTrendingHomes);
    on<FetchMoreTrendingMovies>(_onFetchTrendingHomes);

    on<SearchMovies>(
        _onSearchHomes); // Register the handler for the SearchHomes event
  }

  Future<void> _onFetchTrendingHomes(event, Emitter<HomeState> emit) async {
    if (_isFetching) return; // Prevent simultaneous fetch calls

    _isFetching = true;
    try {
      if (state is! HomeLoaded) {
        emit(HomeLoading());
      }

      print(_currentPage);
      final currentMovies =
          state is HomeLoaded ? (state as HomeLoaded).movies : [];

      final newMovies =
          await movieRepository.fetchTrendingMovies(page: _currentPage);

      emit(HomeLoaded([...currentMovies, ...newMovies]));

      _currentPage++;
    } on SocketException {
      emit(HomeError('No Internet Connection. Please try again.'));
    } on FormatException {
      emit(HomeError('Bad response format from the server.'));
    } catch (error) {
      emit(HomeError(error.toString()));
    } finally {
      _isFetching = false;
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
    } on SocketException {
      emit(HomeError('No Internet Connection. Please try again.'));
    } on FormatException {
      emit(HomeError('Bad response format from the server.'));
    } catch (error) {
      emit(HomeError(error.toString()));
    }
  }
}
