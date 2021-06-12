import 'dart:async';

import 'package:gamesearch1/auth_provider/firebase_auth.dart';
import 'package:gamesearch1/logic/manage_auth/auth_event.dart';
import 'package:gamesearch1/logic/manage_auth/auth_state.dart';
import 'package:gamesearch1/models/user.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuthenticationService _authenticationService;
  StreamSubscription _authenticationStream;

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService = FirebaseAuthenticationService();

    _authenticationStream =
        _authenticationService.user.listen((UserModel userModel) {
      add(InnerServerEvent(userModel));
    });
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    try {
      if (event == null) {
        yield Unauthenticated();
      } else if (event is RegisterUser) {
        await _authenticationService.createUserWithEmailAndPassword(
            email: event.email, password: event.senha);
      } else if (event is LoginAnonymousUser) {
        await _authenticationService.signInAnonimo();
      } else if (event is LoginUser) {
        await _authenticationService.signInWithEmailAndPassword(
            email: event.email, password: event.senha);
      } else if (event is InnerServerEvent) {
        if (event.userModel == null) {
          yield Unauthenticated();
        } else {
          //FirebaseRemoteServer.uid = event.userModel.uid;
          yield Authenticated(user: event.userModel);
        }
      } else if (event is Logout) {
        await _authenticationService.signOut();
      }
    } catch (e) {
      yield AuthError(message: e.toString());
    }
  }
}
