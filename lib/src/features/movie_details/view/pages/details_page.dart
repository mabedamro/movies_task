import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/src/features/home/view/widgets/movie_card.dart';
import 'package:movies_task/src/features/movie_details/data/details_bloc/details_bloc.dart';
import 'package:movies_task/src/features/movie_details/data/details_bloc/details_event.dart';
import 'package:movies_task/src/features/movie_details/data/details_bloc/details_state.dart';
import 'package:movies_task/src/features/movie_details/models/movie_details_model.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;

  MovieDetailsPage(this.movieId);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    super.initState();
    // Trigger the movie load whenever the screen is initialized
    context.read<DetailsBloc>().add(FetchMovieDetails(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DetailsLoaded) {
            MovieDetails movie = (state as DetailsLoaded).movie;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Backdrop image
                  Stack(
                    children: [
                      Image.network(
                        '${movie.backdropPath}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Movie title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Release date and rating
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          'Release Date: ${movie.releaseDate}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              '${movie.voteAverage}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Overview
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      movie.overview,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is DetailsError) {
            // return Center(child: Text(state.message));
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(state.message)),
                TextButton(
                    onPressed: () {
                      context
                          .read<DetailsBloc>()
                          .add(FetchMovieDetails(widget.movieId));
                    },
                    child: Text('Rety'))
              ],
            );
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
