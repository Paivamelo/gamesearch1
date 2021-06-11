import 'dart:async';
import 'package:gamesearch1/data/webserver/remote_database.dart';
import 'package:gamesearch1/logic/monitor_db/monitor_db_event.dart';
import 'package:gamesearch1/logic/monitor_db/monitor_db_state.dart';
import 'package:gamesearch1/model/feedback.dart';
import 'package:bloc/bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _remoteSubscription;
  List<UserFeedback> remoteFeedbackList;
  List<int> remoteIdList;

  MonitorBloc() : super(MonitorState(feedbackList: [], idList: [])) {
    add(AskNewList());

    _remoteSubscription = DatabaseRemoteServer.helper.stream.listen((response) {
      try {
        remoteFeedbackList = response[0];
        remoteIdList = response[1];
        add(UpdateList(
            feedbackList: List.from(remoteFeedbackList),
            idList: List.from(remoteIdList)));
      } catch (e) {}
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      //alguem esta pedindo uma lista
      var remoteResponse = await DatabaseRemoteServer.helper.getFeedbackList();
      yield MonitorState(
          feedbackList: List.from(remoteFeedbackList),
          idList: List.from(remoteIdList));
    } else if (event is UpdateList) {
      yield MonitorState(
          idList: event.idList, feedbackList: event.feedbackList);
    }
  }

  close() {
    _remoteSubscription.cancel();
    return super.close();
  }
}
