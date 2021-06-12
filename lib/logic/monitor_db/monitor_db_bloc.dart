import 'dart:async';

//import 'package:gamesearch1/data/firebase/firebase_database.dart';
import 'package:gamesearch1/data/webserver/remote_database.dart';
import 'package:gamesearch1/logic/monitor_db/monitor_db_event.dart';
import 'package:gamesearch1/logic/monitor_db/monitor_db_state.dart';
import 'package:gamesearch1/models/feedback.dart';
import 'package:bloc/bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _remoteSubscription;
  //StreamSubscription _firebaseSubscription;

  List<UserFeedback> remoteFeedbackList;
  List<UserFeedback> firebaseNoteList;
  List<int> remoteIdList;
  List<String> firebaseIdList;

  MonitorBloc() : super(MonitorState(feedbackList: [], idList: [])) {
    add(AskNewList());

    _remoteSubscription = DatabaseRemoteServer.helper.stream.listen((response) {
      try {
        remoteFeedbackList = response[0];
        remoteIdList = response[1];
      } catch (e) {}
    });
    /*
    _firebaseSubscription =
        FirebaseRemoteServer.helper.stream.listen((response) {
      try {
        firebaseNoteList = response[0];
        firebaseIdList = response[1];
        add(UpdateList(
          noteList: List.from(localNoteList)
            ..addAll(remoteNoteList)
            ..addAll(firebaseNoteList),
          idList: List.from(localIdList)
            ..addAll(remoteIdList)
            ..addAll(firebaseIdList),
        ));
      } catch (e) {}
    });*/
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      var remoteResponse = await DatabaseRemoteServer.helper.getFeedbackList();
      //var firebaseResponse = await FirebaseRemoteServer.helper.getNoteList();
      remoteFeedbackList = remoteResponse[0];
      remoteIdList = remoteResponse[1];
      //firebaseNoteList = firebaseResponse[0];
      //firebaseIdList = firebaseResponse[1];
      yield MonitorState(
          feedbackList:
              List.from(remoteFeedbackList), //..addAll(firebaseNoteList),
          idList: List.from(remoteIdList)); //..addAll(firebaseIdList));
    }
  }

  close() {
    _remoteSubscription.cancel();
    //_firebaseSubscription.cancel();
    return super.close();
  }
}
