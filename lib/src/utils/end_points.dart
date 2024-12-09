class EndPoints {
  static String apiKey = "a5ab363e677990594c15ff2d53d3ffa9";
  static String base_url = "https://api.themoviedb.org/3";
  static String lang = 'language=en-US';
  static trendingMovies(page) {
    return base_url + "/trending/movie/day?$lang&api_key=$apiKey&page=$page";
  }

  static details(id) {
    return base_url + "/movie/$id?api_key=$apiKey&$lang";
  }

  static search(query) {
    return base_url + "/search/movie?api_key=${apiKey}&query=$query&$lang";
  }
}
