import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movie_rental_mhsp/src/core/features/login/controllers/login_controller.dart';
import 'package:movie_rental_mhsp/src/core/features/login/data/datasources/login_datasource.dart';
import 'package:movie_rental_mhsp/src/core/features/login/data/repositories/login_repository.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/data/repositories/movies_repository.dart';

final getIt = GetIt.instance;

void setupDepencendes() {

  getIt.registerFactory(() => http.Client());

  getIt.registerFactory(() => LoginDatasource(getIt()));

  getIt.registerFactory(() => LoginRepository(getIt()));

  getIt.registerFactory(() => MoviesRepository(getIt()));

  getIt.registerFactory(() => MoviesDatasource(getIt()));

  getIt.registerLazySingleton<LoginController>(() => LoginController(getIt()));
  
}