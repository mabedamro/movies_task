import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
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
            MovieDetails movie = state.movie;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Backdrop image
                  Image.network(
                    '${movie.backdropPath}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 30.h,
                  ),
                  SizedBox(height: 3.h),
                  // Movie title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 24.dp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  // Release date and rating
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          'Release Date: ${movie.releaseDate}',
                          style: TextStyle(fontSize: 14.dp),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 1.w),
                            Text(
                              '${movie.voteAverage}',
                              style: TextStyle(fontSize: 14.dp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  // Overview
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 20.dp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      movie.overview,
                      style: TextStyle(fontSize: 15.dp),
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
                    child: const Text('Rety'))
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
