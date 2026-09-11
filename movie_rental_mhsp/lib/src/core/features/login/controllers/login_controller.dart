import 'package:movie_rental_mhsp/src/core/features/login/data/repositories/login_repository.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';
import 'package:signals/signals.dart';
import 'package:go_router/go_router.dart';


class LoginController {

  //final _user = signal<User?>(null);

  final _login = signal<String>('');
  final _password = signal<String>('');

  String get login => _login.value;
  String get password => _password.value;
  //User? get user => _user.value;

  final LoginRepository loginRepository;

  LoginController(this.loginRepository);


Future<User?> executeLogin(String login, String password) async{
  print("Executando login...");
  try{
    int userId = await loginRepository.executeLogin(login, password);
    print("Login funcionou!");

    User user =User(id : userId, username: login, password: password);
    
    return user;

  }
  catch(e){
    print(e);
  }
  return null;

}


void clearInformation(){
    batch(() //Atualiza tudo de vez
    {
      _login.value = '';
      _password.value = '';
    });


}

}