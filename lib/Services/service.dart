import 'package:dio/dio.dart';
import '../Const/global.dart';
import '../Model/moviedetails.dart';
import '../Model/moviesmodel.dart';
import '../Model/serchmoviemodel.dart';

class MovieDatas {
  Dio dio = Dio();

  Future<List<Movies>> getPopularMovies(int page) async {
    try {
      final response = await dio.get(
        "$movieBaseUrl/movie/popular?api_key=$apiKey&page=$page",
      );
      final List data = response.data["results"];
      return data.map((e) => Movies.fromJson(e)).toList();
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<List<Movies>> getTopRatedMovies(int page) async {
    try {
      final response = await dio.get(
        "$movieBaseUrl/movie/top_rated?api_key=$apiKey&page=$page",
      );
      final List data = response.data["results"];
      return data.map((e) => Movies.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<MovieDetails> getMovieDetails(int movieid) async {
    try {
      final response =
          await dio.get("$movieBaseUrl/movie/$movieid?api_key=$apiKey");
      return MovieDetails.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Movies>> getRandomMovie(int page) async {
    try {
      final response = await dio
          .get("$movieBaseUrl/movie/popular?api_key=$apiKey&page=$page");
      final List data = response.data["results"];
      return data.map((e) => Movies.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<SearchResult>> searchMovies(String query, int page) async {
    try {
      final response = await dio.get(
          "$movieBaseUrl/search/movie?api_key=$apiKey&query=$query&page=$page");
      final List data = response.data["results"];
      return data.map((e) => SearchResult.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Search> movieSearchLastPage(
    String query,
  ) async {
    try {
      final response = await dio
          .get("$movieBaseUrl/search/movie?api_key=$apiKey&query=$query");

      return Search.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}