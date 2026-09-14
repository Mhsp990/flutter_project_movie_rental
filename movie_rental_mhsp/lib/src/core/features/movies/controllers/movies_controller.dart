import 'package:movie_rental_mhsp/src/core/features/movies/data/repositories/movies_repository.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';
import 'package:signals/signals.dart';

class MoviesController {
  final _moviesList = listSignal<Movie>([]);
  final _user = signal<User?>(null);
  final _isRental = signal<bool>(false);

  final MoviesRepository _moviesRepository;
 

  List<Movie> get movies => _moviesList.value;
  User? get user => _user.value;
  bool get isRental => _isRental.value;


  MoviesController(this._moviesRepository);

  void initUser(User user){
    _user.value = user;

  }

  void enableOrDisableRental(bool desired){
    _isRental.value = desired;
  }


  void getMoviesList() async {
    // try{
    //   final result = await _moviesRepository.getMovies();
    // batch(() //Atualiza tudo de vez
    // {
    //   _moviesList.clear();
    //   _moviesList.value = result.movies;
    // });

    // }
    // catch(e){
    //   print(e);
    // }
  }
  

  // Future<bool> rentMovie(int userId, int movieId) async{
  //   try{
  //     final result = await _moviesRepository.rentMovie(userId, movieId);
  //     if (result){
  //       print("Filme alugado com sucesso");
  //       return true;
  //     }
  //     else{
  //       print("Não foi possível alugar o filme.");
  //       return false;
  //     }

  //   }
  //   catch(e){
  //     print(e);
  //   }
  //   return false;
  // }


  // void getMoviesByUser(int userId) async{
  //     try{
  //     final result = await _moviesRepository.moviesByUser(userId);
  //     batch(() //Atualiza tudo de vez
  //     {
  //       _moviesList.clear();
  //       _moviesList.value = result.movies;
  //     });

  //   }
  //   catch(e){
  //     print(e);

  //   }
  // }


  // Future<bool> watchMovieAndReturn(int userId, int movieId) async {
  //   try{
  //     final result = await _moviesRepository.watchMovieAndReturn(userId, movieId);
      
  //     if (result){
  //       print("Filme foi assistido e devolvido com sucesso");
  //     }
  //     else{
  //       print("Erro : Não foi possível assistir e devolver o filme");
  //     }

  //     return result;

  //   }
  //   catch(e){
  //     print(e);
  //   }
  //   return false;
  // }



  



}