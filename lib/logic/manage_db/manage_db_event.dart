import 'package:gamesearch1/model/feedback.dart';

abstract class ManageEvent {}

//para remover algo, basta saber a id do que deve ser removido
class DeleteEvent extends ManageEvent {
  int userId;
  DeleteEvent({this.userId});
}

class SubmitEvent extends ManageEvent {
  User user;
  SubmitEvent({this.user});
}
