import 'package:gamesearch1/model/feedback.dart';

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {
  List<UserFeedback> feedbackList;
  List<int> idList;
  UpdateList({this.feedbackList, this.idList});
}
