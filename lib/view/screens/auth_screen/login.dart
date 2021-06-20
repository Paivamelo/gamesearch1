import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesearch1/logic/manage_auth/auth_bloc.dart';
import 'package:gamesearch1/logic/manage_auth/auth_event.dart';
import 'package:gamesearch1/view/screens/auth_screen/resetpassword.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return loginForm();
  }

  Widget loginForm() {
    final GlobalKey<FormState> formKey = new GlobalKey();
    final LoginUser loginData = new LoginUser();
    return Form(
        key: formKey,
        child: Container(
            padding: EdgeInsets.only(
              top: 50,
              left: 40,
              right: 40,
            ),
            color: Colors.white,
            child: ListView(children: [
              header(),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                initialValue: "",
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Play',
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (String inValue) {
                  if (inValue.length == 0) {
                    return "Digite o seu email";
                  }
                  return null;
                },
                onSaved: (String inValue) {
                  loginData.email = inValue;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                initialValue: "",
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Play',
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (String inValue) {
                  if (inValue.length == 0) {
                    return "Digite a sua senha";
                  }
                  return null;
                },
                onSaved: (String inValue) {
                  loginData.senha = inValue;
                },
              ),
              recuperarSenha(),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                child: ElevatedButton(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Play",
                        fontSize: 26,
                        letterSpacing: 4,
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        BlocProvider.of<AuthBloc>(context).add(loginData);
                      }
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                child: ElevatedButton(
                  child: Text(
                    "LOGIN ANÔNIMO",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Play",
                      fontSize: 26,
                      letterSpacing: 4,
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context)
                        .add(LoginAnonymousUser());
                  },
                ),
              ),
            ])));
  }

  Widget header() {
    return Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage('assets/images/game.png'))));
  }

  Widget recuperarSenha() {
    return Container(
      height: 40,
      alignment: Alignment.centerRight,
      child: TextButton(
        //autofocus: true,
        child: Text(
          "Recuperar Senha",
          style: TextStyle(
            fontFamily: 'Gameover',
            fontSize: 38,
            color: Colors.black87,
          ),
        ),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Telareset())),
      ),
    );
  }
}
