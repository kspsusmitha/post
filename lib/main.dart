import 'package:clean_post/appliaction/bloc/auth_bloc.dart';
import 'package:clean_post/appliaction/pages/login_page.dart';
import 'package:clean_post/data/datasource/auth_remote_datasource.dart';
import 'package:clean_post/data/repositories/auth_repository.dart';
import 'package:clean_post/domain/usecases/login_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';


void main() {
  final dio = Dio();
  final remoteDataSource = AuthRemoteDataSource(dio);
  final authRepository = AuthRepositoryImpl(remoteDataSource);
  final loginUseCase = LoginUseCase(authRepository);

  runApp(MyApp(loginUseCase));
}

class MyApp extends StatelessWidget {
  final LoginUseCase loginUseCase;

  const MyApp(this.loginUseCase, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Login',
      home: BlocProvider(
        create: (_) => AuthBloc(loginUseCase),
        child: const LoginPage(),
      ),
    );
  }
}
