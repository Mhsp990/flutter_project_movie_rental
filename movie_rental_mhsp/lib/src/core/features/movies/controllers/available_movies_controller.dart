import 'package:movie_rental_mhsp/src/core/features/movies/data/repositories/movies_repository.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';
import 'package:signals/signals_core.dart';

class AvailableMoviesController {

  final _moviesList = listSignal<Movie>([]);
  final _user = signal<User?>(null);

  final MoviesRepository _moviesRepository;

  List<Movie> get movies => _moviesList.value;
  User? get user => _user.value;

  AvailableMoviesController(this._moviesRepository);


  void initUser(User user){
    _user.value = user;
  }


  void getMoviesList() async {
    try{
      final result = await _moviesRepository.getMovies();
    batch(() //Atualiza tudo de vez
    {
      _moviesList.clear();
      _moviesList.value = result.movies;
    });

    }
    catch(e){
      print(e);
    }
  }

}