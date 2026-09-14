//import 'package:movie_rental_mhsp/src/core/di/injection.dart';
import 'package:movie_rental_mhsp/src/core/features/movies/data/repositories/movies_repository.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';
import 'package:signals/signals.dart';

class RentalController {
  final _moviesList = listSignal<Movie>([]);
  final _user = signal<User?>(null);

  final MoviesRepository _moviesRepository;


  List<Movie> get movies => _moviesList.value;
  User? get user => _user.value;


  RentalController(this._moviesRepository);


  void initUser(User user){
    _user.value = user;
  }


  void getMoviesByUser(int userId) async{
    //Recebe a lista de todos os filmes que o usuário possui.
    try{
      final response = await _moviesRepository.moviesByUser(userId);

      _moviesList.clear();
      _moviesList.value = response.movies;

    }
    catch(e){
      print(e);
    }
  }


  Future<bool> watchMovieAndReturn(int userId, int movieId) async {
    try{
      final result = await _moviesRepository.watchMovieAndReturn(userId, movieId);
      
      if (result){
        print("Filme foi assistido e devolvido com sucesso");
        getMoviesByUser(userId);
      }
      else{
        print("Erro : Não foi possível assistir e devolver o filme");
      }

      return result;

    }
    catch(e){
      print(e);
    }
    return false;
  }


  Future<bool> rentMovie(int userId, int movieId) async{
    try{

      if (_checkUserHasMovie(movieId)){ //Verifica se o usuario já possui o filme
        return false;
      }

      final result = await _moviesRepository.rentMovie(userId, movieId);
      if (result){
        print("Filme alugado com sucesso");
        return true;
      }
      else{
        print("Não foi possível alugar o filme.");
        return false;
      }

    }
    catch(e){
      print(e);
    }
    return false;
  }



bool _checkUserHasMovie(int movieId){
  if (user != null){
    getMoviesByUser(user!.id); //Garantir que está atualizado.
  }
  else{
    print("ERRO : Usuario é nulo!"); //TODO : Lançar erro.
  }
  for (Movie mov in movies){
    if (mov.id == movieId){
      return true;
    }
  }

  return false;
}


}