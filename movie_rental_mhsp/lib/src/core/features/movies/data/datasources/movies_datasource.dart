import 'dart:typed_data';

import 'package:http/http.dart' as hhtp;
import 'package:movie_rental_mhsp/src/core/network/server_address.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class MoviesDatasource {
  final hhtp.Client client;

  MoviesDatasource(this.client);
  

  Future<Uint8List> getMovies() async{
    try{
      final response = await client.post(Uri.parse(availableMovies));
      
      return response.bodyBytes;
        
    }
    catch(e){
      throw Exception('Could not connect to server when trying to get movies list.');
    }
  }
  

  Future<bool> rentMovie(Uint8List rent) async{
    try{
      final response = await client.post(
        Uri.parse(rentalMovie), body: rent, headers: {'Content-Type': 'application/x-protobuf', 'X-Student-Token' : userToken}
        );
      if (response.statusCode == 200){
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      throw Exception('Could not connect to server when trying to login.');
    }
  }


  Future<Uint8List> moviesByUser(Uint8List user) async{
    try{
      final response = await client.post(
      Uri.parse(moviesRentalByUser), body: user, headers: {'Content-Type': 'application/x-protobuf', 'X-Student-Token' : userToken}
      );
      if (response.statusCode == 200){
        return response.bodyBytes;
      }
      else{
        throw Exception('Could not find user when searching movies by user.');
      }
    }catch(e){
      throw Exception('Could not connect to server when trying to get movies by user');
    }

  }


  Future<bool> watchMovieAndReturn(Uint8List rent) async{
    try{
      final response = await client.post(
        Uri.parse(watchMovie), body: rent, headers: {'Content-Type': 'application/x-protobuf', 'X-Student-Token' : userToken}
        );
      if (response.statusCode == 200){
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      throw Exception('Could not connect to server when trying to watch movie.');
    }
  }


}