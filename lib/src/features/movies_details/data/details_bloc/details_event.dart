import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MovieDetailsEvent {}

class FetchMovieDetails extends MovieDetailsEvent {
  final int movieId;

  FetchMovieDetails(this.movieId);
}
