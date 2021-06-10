import 'package:gamesearch1/model/user.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String email;
  String senha;
}

class LoginUser extends AuthEvent {
  String email;
  String senha;
}

class ResetPassword extends AuthEvent {
  String email;
}

class LoginAnonymousUser extends AuthEvent {}

class Logout extends AuthEvent {}

class InnerServerEvent extends AuthEvent {
  final UserModel userModel;
  InnerServerEvent(this.userModel);
}
