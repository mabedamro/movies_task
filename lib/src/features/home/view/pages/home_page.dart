import 'package:flutter/material.dart';
import 'package:movies_task/src/features/home/view/widgets/movie_card.dart';

// Home Page
class HomePage extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      "title": "Inception",
      "poster":
          "https://image.tmdb.org/t/p/w500/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg",
      "rating": "8.8",
    },
    {
      "title": "The Dark Knight",
      "poster":
          "https://image.tmdb.org/t/p/w500/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg",
      "rating": "9.0",
    },
    {
      "title": "Interstellar",
      "poster":
          "https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
      "rating": "8.6",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Trending Movies",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(
                title: movie["title"]!,
                posterUrl: movie["poster"]!,
                rating: movie["rating"]!,
              );
            },
          ),
        ),
      ),
    );
  }
}
