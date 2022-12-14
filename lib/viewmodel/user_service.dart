import 'package:dio/dio.dart';

import '../model/Paintings.dart';

import '../model/User.dart';

class UserService {
  final String baseUrlApi = "http://192.168.0.123:3000";

  Future<UserModel> fetchDataUser(int idUser) async {
    Response response = await Dio().get("$baseUrlApi/users/$idUser");
    UserModel users = UserModel.fromJSON(response.data);
    return users;
  }
}
