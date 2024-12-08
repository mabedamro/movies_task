import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_task/src/features/global/models/movie.dart';

class MovieRepository {
  static String apiKey = "a5ab363e677990594c15ff2d53d3ffa9";
  static String baseUrl = "https://api.themoviedb.org";

  Future<Movie> fetchMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/3/movie/$movieId?api_key=$apiKey&language=en-US'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Movie.fromJson(data);
    } else {
      throw Exception('Failed to fetch movie details');
    }
  }
}
