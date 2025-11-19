
import 'package:clean_post/data/datasource/auth_remote_datasource.dart';
import 'package:clean_post/data/repositories/auth_repository.dart';
import 'package:clean_post/domain/usecases/login_usecase.dart';
import 'package:clean_post/presentation/pages/login_page.dart';
import 'package:clean_post/presentation/provider/login_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final dio = Dio();

  final dataSource = AuthRemoteDataSource(dio);
  final repository = AuthRepositoryImpl(dataSource);
  final loginUseCase = LoginUseCase(repository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(loginUseCase),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
