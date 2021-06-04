import 'dart:async';

import 'package:gamesearch1/data/local/local_database.dart';
import 'package:gamesearch1/data/webserver/remote_database.dart';
import 'package:gamesearch1/logic/monitor_db/monitor_db_event.dart';
import 'package:gamesearch1/logic/monitor_db/monitor_db_state.dart';
import 'package:gamesearch1/model/user.dart';
import 'package:bloc/bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _localSubscription;
  StreamSubscription _remoteSubscription;

  List<User> localUserList;
  List<User> remoteUserList;
  List<int> localIdList;
  List<int> remoteIdList;

  MonitorBloc() : super(MonitorState(userList: [], idList: [])) {
    add(AskNewList());
    _localSubscription = DatabaseLocalServer.helper.stream.listen((response) {
      try {
        localUserList = response[0];
        localIdList = response[1];
        add(UpdateList(
            userList: List.from(localUserList)..addAll(remoteUserList),
            idList: List.from(localIdList)..addAll(remoteIdList)));
      } catch (e) {}
    });

    _remoteSubscription = DatabaseRemoteServer.helper.stream.listen((response) {
      try {
        remoteUserList = response[0];
        remoteIdList = response[1];
        add(UpdateList(
            userList: List.from(localUserList)..addAll(remoteUserList),
            idList: List.from(localIdList)..addAll(remoteIdList)));
      } catch (e) {}
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      //alguem esta pedindo uma lista
      var localResponse = await DatabaseLocalServer.helper.getUserList();
      var remoteResponse = await DatabaseRemoteServer.helper.getUserList();
      remoteUserList = localResponse[0];
      remoteIdList = localResponse[1];
      localUserList = remoteResponse[0];
      localIdList = remoteResponse[1];
      yield MonitorState(
          userList: List.from(localUserList)..addAll(remoteUserList),
          idList: List.from(localIdList)..addAll(remoteIdList));
    } else if (event is UpdateList) {
      yield MonitorState(idList: event.idList, userList: event.userList);
    }
  }

  close() {
    _localSubscription.cancel();
    _remoteSubscription.cancel();
    return super.close();
  }
}
