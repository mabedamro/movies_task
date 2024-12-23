import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:movies_task/src/app/app_colors.dart';
import 'package:movies_task/src/features/home/view/widgets/movie_info.dart';
import 'package:movies_task/src/features/home/view/widgets/movie_poster.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String posterUrl;
  final String rating;
  final int id;
  const MovieCard({
    Key? key,
    required this.title,
    required this.posterUrl,
    required this.rating,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: AppColors.primaryColor.withOpacity(0.4),
        child: Row(
          children: [
            MoviePoster(posterUrl: posterUrl),
            SizedBox(width: 3.w),
            Expanded(
              child: MovieInfo(
                title: title,
                rating: rating,
                id: id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
