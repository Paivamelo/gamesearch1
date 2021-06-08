import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamesearch1/logic/manage_auth/auth_bloc.dart';
import 'package:gamesearch1/view/wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:gamesearch1/view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Launcher());
  //runApp(MaterialApp(home: Splash()));
}

class Launcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: MaterialApp(
          title: 'Gamesearch',
          theme: ThemeData(
            primarySwatch: Colors.pink,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Wrapper()),
    );
  }
}
