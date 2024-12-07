class EndPoints {
  static String apiKey = "a5ab363e677990594c15ff2d53d3ffa9";
  static String base_url = "https://api.themoviedb.org";

  static trendingMovies() {
    return base_url + "/3/trending/movie/day?language=en-US&api_key=$apiKey";
  }
}
