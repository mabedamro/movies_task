import 'package:movies_task/src/features/movie_details/models/movie_details_model.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final MovieDetails movie;

  DetailsLoaded(this.movie);
}

class DetailsError extends DetailsState {
  final String message;

  DetailsError(this.message);
}

class MovieSearchLoaded extends DetailsState {
  final MovieDetails movie;

  MovieSearchLoaded(this.movie); // State for search results
}
