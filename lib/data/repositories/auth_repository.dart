

import 'package:clean_post/data/datasource/auth_remote_datasource.dart';
import 'package:clean_post/domain/entities/user.dart';
import 'package:clean_post/domain/repositories/auth_repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String username, String password) {
    return remoteDataSource.login(username, password);
  }
}
