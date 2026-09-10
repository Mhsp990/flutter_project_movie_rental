import 'dart:typed_data';

import 'package:movie_rental_mhsp/src/shared/proto/login_package.pb.dart';

class LoginAdapter {

  static Uint8List encodeProto(User user){
    return user.writeToBuffer();
  }

  static User decodeProto(Uint8List encoded){
    return User.fromBuffer(encoded);
  }

}