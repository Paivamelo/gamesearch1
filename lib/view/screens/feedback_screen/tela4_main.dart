import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesearch1/logic/manage_db/manage_db_event.dart';
import 'package:gamesearch1/logic/manage_db/manage_db_state.dart';
import 'package:gamesearch1/logic/manage_db/manage_remote_db_bloc.dart';
import 'package:gamesearch1/model/feedback.dart';

class MainTela4 extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageRemoteBloc, ManageState>(
        builder: (context, state) {
      User user;
      user = new User();

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
                emailFormField(user),
                senhaFormField(user),
                recuperarSenha(),
                SizedBox(
                  height: 20,
                ),
                submitButton(user, state, context),
                SizedBox(
                  height: 20,
                ),
                cadastrarButton(),
              ])));
    });
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

  Widget emailFormField(User user) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        initialValue: user.email,
        decoration: InputDecoration(
            labelText: "Email",
            labelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Play',
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value.length == 0) {
            return "Digite o seu email";
          }
          return null;
        },
        onSaved: (value) {
          user.email = value;
        },
      ),
    );
  }

  Widget senhaFormField(User user) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: true,
        initialValue: user.senha,
        decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Play',
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value.length == 0) {
            return "Digite a sua senha";
          }
          return null;
        },
        onSaved: (value) {
          user.senha = value;
        },
      ),
    );
  }

  Widget submitButton(User user, state, context) {
    return Container(
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
              BlocProvider.of<ManageRemoteBloc>(context)
                  .add(SubmitEvent(user: user));
            }
          }),
    );
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
        onPressed: () {},
      ),
    );
  }

  Widget cadastrarButton() {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: TextButton(
        //autofocus: true,
        child: Text(
          "Cadastrar-se",
          style: TextStyle(
            fontFamily: 'Gameover',
            fontSize: 50,
            color: Colors.black87,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
