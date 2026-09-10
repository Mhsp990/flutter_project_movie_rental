

import 'package:movie_rental_mhsp/src/core/features/movies/data/adapters/movies_adapter.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_rental_mhsp/src/shared/adapters/login_adapter.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class MoviesRepository {

  final MoviesDatasource moviesDatasource;

  MoviesRepository(this.moviesDatasource);


  Future<List<int>> getMovies() async{
    try{

      final response = await moviesDatasource.getMovies();

      return MoviesAdapter.decodeProtoMovie(response).cover;

    } catch(e){
      throw Exception('Failed to get movie list information');
    }
  }


  Future<bool> rentMovie(int userId, int movieId) async{
    try{

      Rental rent = Rental(userId: userId, movieId: movieId);
      final response = await moviesDatasource.rentMovie(MoviesAdapter.encodeProtoRental(rent));

      return response;

    } catch(e){
      throw Exception('Failed to get movie list information');
    }
  }


  Future<Movie> moviesByUser(int userId) async{
    try{
      User user = User(id : userId, username: '', password: '');

      final response = await moviesDatasource.moviesByUser(LoginAdapter.encodeProto(user));

      return MoviesAdapter.decodeProtoMovie(response);

    } catch(e){
      throw Exception('Failed to get movie list information');
    }
  }


  Future<bool> watchMovieAndReturn(int userId, int movieId) async {
    try{

      Rental rent = Rental(userId: userId, movieId: movieId);
      final response = await moviesDatasource.watchMovieAndReturn(MoviesAdapter.encodeProtoRental(rent));

      return response;

    } catch(e){
      throw Exception('Failed to get movie list information');
    }
  }


}