import 'package:gamesearch1/model/feedback.dart';

abstract class ManageEvent {}

class DeleteEvent extends ManageEvent {
  var noteId;
  DeleteEvent({this.noteId});
}

class UpdateRequest extends ManageEvent {
  var noteId;
  UserFeedback previousNote;

  UpdateRequest({this.noteId, this.previousNote});
}

class UpdateCancel extends ManageEvent {}

class SubmitEvent extends ManageEvent {
  UserFeedback feedback;
  SubmitEvent({this.feedback});
}
