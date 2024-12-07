import 'package:flutter/material.dart';
import 'package:movies_task/src/features/home/view/widgets/movie_info.dart';
import 'package:movies_task/src/features/home/view/widgets/movie_poster.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String posterUrl;
  final String rating;

  const MovieCard({
    Key? key,
    required this.title,
    required this.posterUrl,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      shadowColor: Colors.deepPurple.withOpacity(0.4),
      child: Row(
        children: [
          MoviePoster(posterUrl: posterUrl),
          const SizedBox(width: 16),
          Expanded(
            child: MovieInfo(title: title, rating: rating),
          ),
        ],
      ),
    );
  }
}
