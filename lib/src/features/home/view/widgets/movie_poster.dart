import 'package:flutter/material.dart';

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
        height: 150,
        width: 100,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey.shade300,
          height: 150,
          width: 100,
          child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
        ),
      ),
    );
  }
}
