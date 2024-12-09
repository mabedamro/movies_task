import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_task/src/core/api/end_points.dart';
import 'package:movies_task/src/features/home/models/movie.dart';

class HomeRepository {
  Future<List<Movie>> fetchTrendingMovies({int page = 1}) async {
    // for home page
    final url = '${EndPoints.trendingMovies(page)}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final results = json['results'] as List;
      return results.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(Uri.parse(EndPoints.search(query)));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
