import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class MoviePoster extends StatelessWidget {
  final String posterUrl;

  const MoviePoster({
    Key? key,
    required this.posterUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        posterUrl,
        height: 20.h,
        width: 30.w,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey.shade300,
          height: 20.h,
          width: 30.w,
          child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
        ),
      ),
    );
  }
}
