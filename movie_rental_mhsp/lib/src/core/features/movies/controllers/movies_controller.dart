import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';
import 'package:signals/signals.dart';

class MoviesController {
  final _movies = signal<List<Movie>>;

  Movie get movies => _movies.value;
}