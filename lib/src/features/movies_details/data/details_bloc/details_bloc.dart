import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/src/features/movies_details/data/details_bloc/details_event.dart';
import 'package:movies_task/src/features/movies_details/data/details_bloc/details_state.dart';
import 'package:movies_task/src/features/movies_details/data/repo/details_repo.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieRepository movieRepository;

  MovieDetailsBloc(this.movieRepository) : super(MovieDetailsInitial()) {
    on<FetchMovieDetails>(_onFetchMovieDetails);
  }

  Future<void> _onFetchMovieDetails(
      FetchMovieDetails event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoading());
    try {
      final movie = await movieRepository.fetchMovieDetails(event.movieId);
      emit(MovieDetailsLoaded(movie));
    } catch (error) {
      emit(MovieDetailsError(error.toString()));
    }
  }
}
