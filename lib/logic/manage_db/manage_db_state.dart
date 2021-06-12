import 'package:gamesearch1/models/feedback.dart';

abstract class ManageState {}

class UpdateState extends ManageState {
  var noteId;
  UserFeedback previousNote;
  UpdateState({this.noteId, this.previousNote});
}

class InsertState extends ManageState {}
