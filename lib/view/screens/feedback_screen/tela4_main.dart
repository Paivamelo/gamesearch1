import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesearch1/logic/manage_db/manage_db_event.dart';
import 'package:gamesearch1/logic/manage_db/manage_db_state.dart';
import 'package:gamesearch1/logic/manage_db/manage_remote_db_bloc.dart';
import 'package:gamesearch1/model/feedback.dart';

class MainTela4<T extends Bloc<ManageEvent, ManageState>>
    extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageRemoteBloc, ManageState>(
        builder: (context, state) {
      UserFeedback feedback;
      feedback = new UserFeedback();
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
                assuntoFormField(feedback),
                SizedBox(
                  height: 10,
                ),
                feedbackFormField(feedback),
                SizedBox(
                  height: 50,
                ),
                submitButton(feedback, state, context),
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

  Widget assuntoFormField(UserFeedback feedback) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
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
          feedback.assunto = value;
        },
      ),
    );
  }

  Widget feedbackFormField(UserFeedback feedback) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
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
          feedback.feedbacktext = value;
        },
      ),
    );
  }

  Widget submitButton(UserFeedback feedback, state, context) {
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
                  .add(SubmitEvent(feedback: feedback));
            }
          }),
    );
  }
}
