import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesearch1/logic/manage_auth/auth_bloc.dart';
import 'package:gamesearch1/logic/manage_auth/auth_event.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Telareset extends StatefulWidget {
  @override
  _TelaresetState createState() => _TelaresetState();
}

class _TelaresetState extends State<Telareset> {
  @override
  Widget build(BuildContext context) {
    return resetForm();
  }

  Widget resetForm() {
    final auth = FirebaseAuth.instance;
    final GlobalKey<FormState> formKey = new GlobalKey();
    final ResetPassword resetEmail = new ResetPassword();
    return new Scaffold(
        body: Form(
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
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Digite seu email para recuperar a senha:",
                      style: TextStyle(
                        fontFamily: 'Play',
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ),
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
                      resetEmail.email = inValue;
                    },
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: TextButton(
                        //autofocus: true,
                        child: Text(
                          "Enviar",
                          style: TextStyle(
                            fontFamily: 'Gameover',
                            fontSize: 50,
                            color: Colors.black87,
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            BlocProvider.of<AuthBloc>(context).add(resetEmail);
                            final snackBar = SnackBar(
                              content: Text("Email Enviado!"),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          auth.sendPasswordResetEmail(email: resetEmail.email);
                        }),
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: TextButton(
                      //autofocus: true,
                      child: Text(
                        "Voltar",
                        style: TextStyle(
                          fontFamily: 'Gameover',
                          fontSize: 50,
                          color: Colors.black87,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ]))));
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
}
