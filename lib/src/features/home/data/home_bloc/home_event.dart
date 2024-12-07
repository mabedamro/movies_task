abstract class HomeEvent {}

class FetchTrendingMovies extends HomeEvent {}

class SearchMovies extends HomeEvent {
  final String query;

  SearchMovies(this.query); // Constructor to accept search query.
}
