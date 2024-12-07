import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_bloc.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_event.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_state.dart';
import 'package:movies_task/src/features/home/view/widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending Movies"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0), // Height of the search bar
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (query) {
                context.read<HomeBloc>().add(SearchMovies(query));
              },
              decoration: InputDecoration(
                hintText: 'Search movies...',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            context.read<HomeBloc>().add(FetchTrendingMovies());
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded || state is MovieSearchLoaded) {
            final movies = state is MovieSearchLoaded
                ? state.movies
                : (state as HomeLoaded).movies;

            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCard(
                    title: movie.title,
                    posterUrl:
                        'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                    rating: movie.voteAverage.toString());
              },
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
