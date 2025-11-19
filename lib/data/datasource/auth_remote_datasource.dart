import 'package:dio/dio.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<UserModel> login(String username, String password) async {
    final response = await dio.post(
      'https://dummyjson.com/auth/login',
      data: {
        "username": username,//emilys
        "password": password,//emilyspass
      },
     
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception("Failed to login");
    }
  }
}
