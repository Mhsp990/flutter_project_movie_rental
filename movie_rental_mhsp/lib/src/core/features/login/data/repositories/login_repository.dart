
import 'package:movie_rental_mhsp/src/core/features/login/data/datasources/login_datasource.dart';
import 'package:movie_rental_mhsp/src/shared/adapters/login_adapter.dart';
import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class LoginRepository {
  final LoginDatasource loginDatasource;

  LoginRepository(this.loginDatasource);

  Future<int> executeLogin(String login, String password) async{
    try{
      // chamar o adaptar para converter para lista de int
      User user = User(username : login, password: password );
      final result = await loginDatasource.validateLogin(LoginAdapter.encodeProto(user));
      
      final result_decode = LoginAdapter.decodeProto(result);

      return result_decode.id;

    } catch(e){
      throw Exception('Failed to post');
    }
  }

}