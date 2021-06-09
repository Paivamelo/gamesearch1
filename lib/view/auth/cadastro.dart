import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesearch1/logic/manage_auth/auth_bloc.dart';
import 'package:gamesearch1/logic/manage_auth/auth_event.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return registerForm();
  }

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  bool checkBoxValue = false;
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool switchValue = false;
  bool switchValue1 = false;
  bool switchValue2 = false;

  Widget registerForm() {
    final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
    final RegisterUser registerData = new RegisterUser();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 55,
                          fontFamily: 'Gameover',
                        ),
                      ),
                      /* onSaved: (String invalue) {
                        registerData.email = invalue;
                      },*/
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 55,
                          fontFamily: 'Gameover',
                        ),
                      ),
                      onSaved: (String invalue) {
                        registerData.email = invalue;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // autofocus: true,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 55,
                          fontFamily: 'Gameover',
                        ),
                      ),
                      onSaved: (String invalue) {
                        registerData.senha = invalue;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Selecione seus gêneros preferidos:",
                        style: TextStyle(
                          fontFamily: 'Play',
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Aventura",
                          style: TextStyle(
                            fontFamily: 'Gameover',
                            fontSize: 45,
                            color: Colors.black87,
                          ),
                        ),
                        Checkbox(
                          value: checkBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              checkBoxValue = value;
                            });
                          },
                        ),
                        Text(
                          "Multijogador",
                          style: TextStyle(
                            fontFamily: 'Gameover',
                            fontSize: 45,
                            color: Colors.black87,
                          ),
                        ),
                        Checkbox(
                          value: checkBoxValue1,
                          onChanged: (bool value) {
                            setState(() {
                              checkBoxValue1 = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Battle Royale",
                              style: TextStyle(
                                fontFamily: 'Gameover',
                                fontSize: 45,
                                color: Colors.black87,
                              ),
                            ),
                            Checkbox(
                              value: checkBoxValue2,
                              onChanged: (bool value) {
                                setState(() {
                                  checkBoxValue2 = value;
                                });
                              },
                            ),
                            Text(
                              "Indie",
                              style: TextStyle(
                                fontFamily: 'Gameover',
                                fontSize: 45,
                                color: Colors.black87,
                              ),
                            ),
                            Checkbox(
                              value: checkBoxValue3,
                              onChanged: (bool value) {
                                setState(() {
                                  checkBoxValue3 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        "Selecione as plataformas(pode ser alterado no futuro):",
                        style: TextStyle(
                          fontFamily: 'Play',
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            "PS4",
                            style: TextStyle(
                              fontFamily: 'Gameover',
                              fontSize: 45,
                              color: Colors.black87,
                            ),
                          ),
                          Switch(
                              value: switchValue,
                              onChanged: (bool value) {
                                setState(() {
                                  switchValue = value;
                                });
                              }),
                          Text(
                            "PC",
                            style: TextStyle(
                              fontFamily: 'Gameover',
                              fontSize: 45,
                              color: Colors.black87,
                            ),
                          ),
                          Switch(
                              value: switchValue1,
                              onChanged: (bool value) {
                                setState(() {
                                  switchValue1 = value;
                                });
                              }),
                          Text(
                            "XBOX",
                            style: TextStyle(
                              fontFamily: 'Gameover',
                              fontSize: 45,
                              color: Colors.black87,
                            ),
                          ),
                          Switch(
                              value: switchValue2,
                              onChanged: (bool value) {
                                setState(() {
                                  switchValue2 = value;
                                });
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.pink[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: SizedBox.expand(
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "CADASTRAR",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Play",
                                  fontSize: 26,
                                  letterSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              BlocProvider.of<AuthBloc>(context)
                                  .add(registerData);
                            }
                            final snackBar = SnackBar(
                              content: Text("Cadastro Realizado!"),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
