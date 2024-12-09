import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_task/src/core/api/end_points.dart';
import 'package:movies_task/src/features/movie_details/models/movie_details_model.dart';

class DetailsRepo {
  Future<MovieDetails> fetchMovieDetails(id) async {
    // Fetching movie Details from the API endpoint
    final response = await http.get(Uri.parse(EndPoints.details(id)));

    if (response.statusCode == 200) {
      // If the API request is successful, parse the response
      final data = json.decode(response.body);
      final movie = data as Map<String, dynamic>;

      // Return a movie details from JSON data to movie model
      return MovieDetails.fromJson(movie);
    } else {
      // If the API request fails, throw an exception
      throw Exception('Failed to load movie details');
    }
  }
}
