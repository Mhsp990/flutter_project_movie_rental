import 'dart:typed_data';

import 'package:http/http.dart' as hhtp;
import 'package:movie_rental_mhsp/src/core/network/server_address.dart';

class LoginDatasource {
  final hhtp.Client client;

  LoginDatasource(this.client);


  Future<Uint8List> validateLogin(Uint8List loginInfo) async{
    try{
      final response = await client.post(
        Uri.parse(performLogin), body: loginInfo, headers: {'Content-Type': 'application/x-protobuf'}
        );
      
      if (response.statusCode == 200){
        return response.bodyBytes;
      }
      else{
        throw Exception('Login invalido.');
      }
        
    }
    catch(e){
      throw Exception('Could not connect to server when trying to login.');
    }
  }


}