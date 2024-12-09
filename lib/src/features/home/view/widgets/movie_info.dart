import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:movies_task/src/app/app_colors.dart';
import 'package:movies_task/src/features/movie_details/view/pages/details_page.dart';

class MovieInfo extends StatelessWidget {
  final String title;
  final String rating;
  final int id;
  const MovieInfo(
      {Key? key, required this.title, required this.rating, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.dp,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            SizedBox(width: 1.w),
            Text(
              rating,
              style: TextStyle(
                fontSize: 14.dp,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MovieDetailsPage(id),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "View Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
