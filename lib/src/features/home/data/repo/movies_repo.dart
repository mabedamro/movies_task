import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_task/src/features/home/models/movie.dart';
import 'package:movies_task/src/utils/end_points.dart';

class HomeRepository {
  Future<List<Movie>> fetchTrendingMovies() async {
    // Fetching trending movies from the API endpoint
    final response = await http.get(Uri.parse(EndPoints.trendingMovies()));

    if (response.statusCode == 200) {
      // If the API request is successful, parse the response
      final data = json.decode(response.body);
      final results = data['results'] as List;

      // Return a list of movies by mapping through the JSON data
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      // If the API request fails, throw an exception
      throw Exception('Failed to load movies');
    }
  }
}
