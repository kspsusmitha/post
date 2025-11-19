import 'package:flutter/material.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  LoginProvider(this.loginUseCase);

  bool loading = false;
  String? errorMessage;
  User? user;

  Future<void> login(String username, String password) async {
    loading = true;
    errorMessage = null;
    notifyListeners();

    try {
      user = await loginUseCase(username, password);
    } catch (e) {
      errorMessage = e.toString();
      user = null;
    }

    loading = false;
    notifyListeners();
  }
}
