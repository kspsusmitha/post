import 'package:clean_post/data/repositories/auth_repository.dart';
import 'package:clean_post/domain/repositories/auth_repositories.dart';

import '../entities/user.dart';


class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call(String username, String password) {
    return repository.login(username, password);
  }
}
