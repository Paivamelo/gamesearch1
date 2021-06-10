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
                  height: 50,
                ),
                emailFormField(user),
                SizedBox(
                  height: 10,
                ),
                senhaFormField(user),
                SizedBox(
                  height: 50,
                ),
                submitButton(user, state, context),
              ])));
    });
  }

  Widget header() {
    return Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/images/feedback.png'))));
  }

  Widget emailFormField(User user) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        initialValue: user.email,
        decoration: InputDecoration(
            labelText: "Assunto",
            labelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Play',
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value.length == 0) {
            return "Assunto obrigatório";
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
        minLines: 4, //Normal textInputField will be displayed
        maxLines: 6,
        initialValue: user.senha,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: "Escreva seu feedback",
            labelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Play',
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value.length == 0) {
            return "Feedback obrigatório";
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
      height: 40,
      child: ElevatedButton(
          child: Text(
            "ENVIAR FEEDBACK",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Gameover",
              fontSize: 45,
              letterSpacing: 3,
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
}
