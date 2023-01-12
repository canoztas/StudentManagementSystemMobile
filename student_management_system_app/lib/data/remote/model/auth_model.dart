import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthModel extends Equatable {
  User? user;
  String? token;

  AuthModel({this.user, this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return _$AuthModelFromJson(json);
  }

  @override
  List<Object?> get props => [user, token];
}

@JsonSerializable(createToJson: false)
class User extends Equatable {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? passwordHash;
  String? photoPath;
  String? userType;

  User({this.userId, this.firstName, this.lastName, this.email, this.passwordHash, this.photoPath, this.userType});

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  @override
  List<Object?> get props => [userId, firstName, lastName, email, passwordHash, photoPath, userType];
}
