import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/src/features/movie_details/data/details_bloc/details_event.dart';
import 'package:movies_task/src/features/movie_details/data/details_bloc/details_state.dart';
import 'package:movies_task/src/features/movie_details/data/repo/details_repo.dart';
import 'package:movies_task/src/core/utils/constants.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DetailsRepo movieRepository;

  DetailsBloc(this.movieRepository) : super(DetailsLoading()) {
    // Registering the event handlers
    on<FetchMovieDetails>(_onFetchMovieDetails);
  }

  Future<void> _onFetchMovieDetails(
      FetchMovieDetails event, Emitter<DetailsState> emit) async {
    emit(DetailsLoading());
    try {
      final movie = await movieRepository.fetchMovieDetails(event.movieId);

      emit(DetailsLoaded(movie));
    } on SocketException {
      emit(DetailsError(Constants.noInternetMsg));
    } on FormatException {
      emit(DetailsError(Constants.formatErrorMsg));
    } catch (error) {
      emit(DetailsError(error.toString()));
    }
  }
}
