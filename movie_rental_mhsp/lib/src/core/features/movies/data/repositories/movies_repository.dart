

import 'package:movie_rental_mhsp/src/core/features/movies/data/adapters/movies_adapter.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_rental_mhsp/src/shared/adapters/login_adapter.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class MoviesRepository {

  final MoviesDatasource moviesDatasource;

  MoviesRepository(this.moviesDatasource);


  Future<Movies> getMovies() async{
    try{

      final response = await moviesDatasource.getMovies();

      return MovieAdapter.decodeProtoMovies(response);

    } catch(e){
      throw Exception('Failed to get movie list information');
    }
  }


  Future<bool> rentMovie(int userId, int movieId) async{
    try{

      Rental rent = Rental(userId: userId, movieId: movieId);
      final response = await moviesDatasource.rentMovie(MovieAdapter.encodeProtoRental(rent));

      return response;

    } catch(e){
      throw Exception('Failed to get movie list information');
    }
  }


  Future<Movies> moviesByUser(int userId) async{
    try{
      User user = User(id : userId, username: '', password: '');

      final response = await moviesDatasource.moviesByUser(LoginAdapter.encodeProto(user));

      return MovieAdapter.decodeProtoMovies(response);

    } catch(e){
      throw Exception('Failed to get movie list information');
    }
  }


  Future<bool> watchMovieAndReturn(int userId, int movieId) async {
    try{

      Rental rent = Rental(userId: userId, movieId: movieId);
      final response = await moviesDatasource.watchMovieAndReturn(MovieAdapter.encodeProtoRental(rent));

      return response;

    } catch(e){
      throw Exception('Failed to get movie list information');
    }
  }


}