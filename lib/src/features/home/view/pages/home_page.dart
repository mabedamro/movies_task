// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_task/src/features/home/data/home_bloc/home_bloc.dart';
// import 'package:movies_task/src/features/home/data/home_bloc/home_event.dart';
// import 'package:movies_task/src/features/home/data/home_bloc/home_state.dart';
// import 'package:movies_task/src/features/home/view/widgets/movie_card.dart';

// class HomePage extends StatelessWidget {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Trending Movies"),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(56.0), // Height of the search bar
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (query) {
//                 context.read<HomeBloc>().add(SearchMovies(query));
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search movies...',
//                 suffixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: BlocBuilder<HomeBloc, HomeState>(
//         builder: (context, state) {
//           if (state is HomeInitial) {
//             context.read<HomeBloc>().add(FetchTrendingMovies());
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is HomeLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is HomeLoaded || state is MovieSearchLoaded) {
//             final movies = state is MovieSearchLoaded
//                 ? state.movies
//                 : (state as HomeLoaded).movies;

//             return ListView.builder(
//               itemCount: movies.length,
//               itemBuilder: (context, index) {
//                 final movie = movies[index];
//                 return MovieCard(
//                   title: movie.title,
//                   posterUrl:
//                       'https://image.tmdb.org/t/p/w200${movie.posterPath}',
//                   rating: movie.voteAverage.toString(),
//                   id: movie.id,
//                 );
//               },
//             );
//           } else if (state is HomeError) {
//             return Center(child: Text(state.message));
//           } else {
//             return const Center(child: Text("Something went wrong"));
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_bloc.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_event.dart';
import 'package:movies_task/src/features/home/data/home_bloc/home_state.dart';
import 'package:movies_task/src/features/home/view/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isInitialed = false;
  @override
  void initState() {
    super.initState();

    // Listen to the scroll controller for triggering pagination
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoadingMore()) {
        context.read<HomeBloc>().add(FetchMoreTrendingMovies());
      }
    });
  }

  bool _isLoadingMore() {
    final currentState = context.read<HomeBloc>().state;
    return currentState is HomeLoadingMore;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

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
                suffixIcon: const Icon(Icons.search),
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
          } else if (state is HomeLoaded ||
              state is MovieSearchLoaded ||
              state is HomeLoadingMore) {
            final movies = state is MovieSearchLoaded
                ? state.movies
                : (state as HomeLoaded).movies;
            isInitialed = true;
            return ListView.builder(
              controller: _scrollController,
              itemCount: movies.length + (isInitialed ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == movies.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final movie = movies[index];
                return MovieCard(
                  title: movie.title,
                  posterUrl:
                      'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                  rating: movie.voteAverage.toString(),
                  id: movie.id,
                );
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
