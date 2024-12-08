import 'package:movies_task/src/features/movie_details/models/genre.dart';
import 'package:movies_task/src/features/movie_details/models/production_company.dart';
import 'package:movies_task/src/features/movie_details/models/production_country.dart';
import 'package:movies_task/src/features/movie_details/models/spoken_lang.dart';

class MovieDetails {
  final bool adult;
  final String? backdropPath;
  final int id;
  final String originalTitle;
  final String title;
  final String overview;
  final String? posterPath;
  final double popularity;
  final String originalLanguage;
  final String releaseDate;
  final List<Genre> genres;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<SpokenLanguage> spokenLanguages;
  final String? homepage;
  final String? imdbId;
  final String status;
  final String? tagline;
  final int? runtime;
  final double voteAverage;
  final int voteCount;
  final int budget;
  final int revenue;

  MovieDetails({
    required this.adult,
    this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.title,
    required this.overview,
    this.posterPath,
    required this.popularity,
    required this.originalLanguage,
    required this.releaseDate,
    required this.genres,
    required this.productionCompanies,
    required this.productionCountries,
    required this.spokenLanguages,
    this.homepage,
    this.imdbId,
    required this.status,
    this.tagline,
    this.runtime,
    required this.voteAverage,
    required this.voteCount,
    required this.budget,
    required this.revenue,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      id: json['id'],
      originalTitle: json['original_title'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      popularity: (json['popularity'] as num).toDouble(),
      originalLanguage: json['original_language'],
      releaseDate: json['release_date'],
      genres: (json['genres'] as List)
          .map((genre) => Genre.fromJson(genre))
          .toList(),
      productionCompanies: (json['production_companies'] as List)
          .map((company) => ProductionCompany.fromJson(company))
          .toList(),
      productionCountries: (json['production_countries'] as List)
          .map((country) => ProductionCountry.fromJson(country))
          .toList(),
      spokenLanguages: (json['spoken_languages'] as List)
          .map((language) => SpokenLanguage.fromJson(language))
          .toList(),
      homepage: json['homepage'],
      imdbId: json['imdb_id'],
      status: json['status'],
      tagline: json['tagline'],
      runtime: json['runtime'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      budget: json['budget'],
      revenue: json['revenue'],
    );
  }
}
