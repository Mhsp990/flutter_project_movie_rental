import 'dart:typed_data';

import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class MoviesAdapter {
  static Movie decodeProtoMovie(Uint8List data){
      try{
        return Movie.fromBuffer(data);
      } catch (e){
        throw Exception("Error : Could not decode MOVIE data");
      }
    }


  static Uint8List encodeProtoMovie(Movie movie){
    return movie.writeToBuffer();
  }


  static Rental decodeProtoRental(Uint8List data){
    try{
      return Rental.fromBuffer(data);
    }
    catch(e){
      throw Exception("Error : Could not decode RENT data");
    }
  }


  static Uint8List encodeProtoRental(Rental rental){
    return rental.writeToBuffer();
  }

}