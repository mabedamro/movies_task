abstract class DetailsEvent {}

class FetchMovieDetails extends DetailsEvent {
  final int movieId;

  FetchMovieDetails(this.movieId);
}
