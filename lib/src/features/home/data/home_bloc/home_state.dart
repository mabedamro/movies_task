import 'package:movies_task/src/features/home/models/movie.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Movie> movies;

  HomeLoaded(this.movies);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

class HomeSearchEmpty extends HomeState {
  final String message;

  HomeSearchEmpty(this.message);
}

class MovieSearchLoaded extends HomeState {
  final List<Movie> movies;

  MovieSearchLoaded(this.movies); // State for search results
}

class HomeLoadingMore extends HomeState {}
