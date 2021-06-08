import 'package:gamesearch1/model/feedback.dart';

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {
  List<User> userList;
  List<int> idList;
  UpdateList({this.userList, this.idList});
}
