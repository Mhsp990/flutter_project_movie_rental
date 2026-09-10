import 'package:flutter_dotenv/flutter_dotenv.dart';

final address = dotenv.get("ADDRESS");
final port = dotenv.getInt("PORT");
final userToken = dotenv.get("TOKEN");

//final getEngineRoute = '$address:$port/get-engine';
final performLogin = '$address:$port/login';

final availableMovies = '$address:$port/available-movies';

final rentalMovie = '$address:$port/rental-movie';

final moviesRentalByUser = '$address:$port/movies-rental-by-user';

final watchMovie = '$address:$port/watch-movie';
