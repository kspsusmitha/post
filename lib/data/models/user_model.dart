import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required String username}) : super(username: username);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['lastName'],
    );
  }
}
